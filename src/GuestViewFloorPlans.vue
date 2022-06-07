<template>
  <div class="top-stuff">
    <router-link v-bind:to="{ name: 'guestHome' }">Home</router-link
    >&nbsp;|&nbsp;
    <router-link v-bind:to="{ name: 'register' }">Create Account?</router-link>
    <br />
    This is the GuestFloor page
    <div>
      <br />
      <br />
      You're currently looking at: {{ this.currentHouseName }}
      <table class="home-details">
        <tr v-for="floor in floors" v-bind:key="floor.id">
          <div class="floor-level">Floor Level:{{ floor.floorLevel }}</div>
          <table>
            <tr v-for="room in floor.rooms" v-bind:key="room.id">
              <div>
                Room:
                {{ room.roomName }} <br />
                Room Size: {{ room.roomSize }} <br />
                Number of Windows: {{ room.numOfWindows }} <br />
                <br />
              </div>
            </tr>
          </table>
          <br />
        </tr>
      </table>

      <!--Drawing component-->
      <vue-p5 class="floor-map" v-on="{ setup, draw }"></vue-p5>

    </div>
  </div>
</template>

<script>
import HomeService from "../services/HomeService.js";

// You can import this after installing the vue-p5 package:
// npm install --save vue-p5
import VueP5 from "vue-p5";

export default {
  name: "guest-view-floor-plans",
  components: {
    "vue-p5": VueP5
  },
  data() {
    return {
      house_id: this.$store.state.currentHouseId,
      floors: [],
      numOfFloors: 0,
      currentHouseName: "",
    };
  },
  created() {
    this.getHouseDetails();
    this.getFloors(this.house_id);
  },
  methods: {
    getFloors(houseId) {
      HomeService.getFloorDetails(houseId).then((response) => {
        for (let i = 0; i < response.data.length; i++) {
          const eachFloor = response.data[i];
          const newFloor = {
            floorLevel: eachFloor.floorLevel,
            floorId: eachFloor.floorId,
            rooms: [],
          };
          this.floors.push(newFloor);
          this.getRooms(newFloor);
        }
      });
    },
    getRooms(floor) {
      HomeService.getRoomsByFloorId(floor.floorId).then((roomResponse) => {
        for (let i = 0; i < roomResponse.data.length; i++) {
          const eachRoom = roomResponse.data[i];
          const newRooms = {
            roomId: eachRoom.room_id,
            roomName: eachRoom.room_name,
            roomSize: eachRoom.room_size,
            floorID: eachRoom.floor_id,
            isKitchen: eachRoom.is_kitchen,
            isBathroom: eachRoom.is_bathroom,
            numOfWindows: eachRoom.number_of_windows,
            flooringTierId: eachRoom.flooring_tier_id,
          };
          floor.rooms.push(newRooms);
        }
      });
    },
    getHouseDetails() {
      HomeService.getHouseDetails(this.house_id).then((response) => {
        this.currentHouseName = response.data.house_name;
      });
    },
    setup(sketch) {
      // Size of the entire drawing window
      sketch.createCanvas(500, 500);
    },
    draw(sketch) {
      sketch.background(255, 255, 255);

      sketch.fill('black');
      sketch.textSize(24);
      sketch.text("Floor Level: 1", 10, 30);

      // Upper left corner X,Y of outer rectangle (floor)
      const startX = 100;
      const startY = 100;
      
      // Length of each side of square
      const floorSize = 250;
      
      // No fill color
      sketch.noFill();

      // Outline of floor (x, y, width, height)
      sketch.rect(startX, startY, floorSize, floorSize);

      // Get first floor for no particular reason
      const floor = this.floors.length > 0 ? this.floors[0] : null;

      if( floor !== null ){
        const rooms = floor.rooms;

        for( let i = 0; i < rooms.length; i++ ){
          const size = floorSize / rooms.length;
          const x = startX + ( i * size );
          const y = startY;

          sketch.fill('black');
          sketch.text("Room " + i, x + 10, y + (size / 2));

          sketch.noFill();
          sketch.rect(x, y, size, size);
          sketch.rect(x, y, size, size);
        }
      }
    }
  },
};
</script>
<style>
.top-stuff {
  text-align: left;
  margin-left: 20px;
  margin-top: 20px;
  font-family: "Montserrat";
  font-weight: bold;
  font-size: 20px;
  color: black;
}
.home-details {
  align-items: center;
  background-color: rgba(54, 148, 66, 0.397);
  margin-left: 50px;
  border-radius: 107px;
  padding-bottom: 60px;
  backdrop-filter: blur(10px);
  color: rgb(0, 0, 0);
  position: absolute;
  margin-top: 25px;
  padding: 60px;
  font-size: 20px;
}

.floor-map {
  position: relative;
  left: 100px;
  top: 100px;
}

.floor-level {
  color: white;
}
</style>
