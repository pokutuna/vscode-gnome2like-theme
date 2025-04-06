type User = {
  name: string;
  id: number;
};

class UserAccount {
  name: string;
  id: number;

  constructor(name: string, id: number) {
    this.name = name;
    this.id = id;
  }
}

const user: User = new UserAccount("pokutuna", 1);

function printUser(user: User): void {
  console.log(`User: ${user.name}, ID: ${user.id}`);
}

printUser(user);
