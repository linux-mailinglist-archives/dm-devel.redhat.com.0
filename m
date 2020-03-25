Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA7919223A
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 09:13:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585124017;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=5CTLOcs2DMzldwsNe2Qr6DThMV5zmTZmkfltcnDvG04=;
	b=Nb4zlpE/frDmGwBDoxUAR/sX29c01mvwAQUFeCSKxYnTAKd8ol8MicAnH0cPs/c/lK2P5w
	6CVeOCynCTgVXBX8gzA9cjsLAG57lWP+lT3edtcTyRr1NgEButEjvOsniiOia7vafvs8jU
	exqKb9tJitgPcacy9zVO/ByzvZ+J+Hc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-Y6qhN4OcOs2z11w8-Ua1eQ-1; Wed, 25 Mar 2020 04:13:33 -0400
X-MC-Unique: Y6qhN4OcOs2z11w8-Ua1eQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CAD68010F5;
	Wed, 25 Mar 2020 08:13:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EDF85DA7C;
	Wed, 25 Mar 2020 08:13:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D0FEE18089CF;
	Wed, 25 Mar 2020 08:13:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02P7TpTD024609 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 03:29:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 00D2D10F1CCA; Wed, 25 Mar 2020 07:29:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F000F10F1CA7
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 07:29:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F556800294
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 07:29:48 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-352-N0wTAKBnNiC1l18PB71XMA-1; Wed, 25 Mar 2020 03:29:45 -0400
X-MC-Unique: N0wTAKBnNiC1l18PB71XMA-1
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02P7NBIk042530; Wed, 25 Mar 2020 07:29:44 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2130.oracle.com with ESMTP id 2ywabr87gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Mar 2020 07:29:43 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02P7MBs8061366; Wed, 25 Mar 2020 07:29:42 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3030.oracle.com with ESMTP id 2yxw943qnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Mar 2020 07:29:42 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02P7TfZf014138;
	Wed, 25 Mar 2020 07:29:41 GMT
Received: from [192.168.1.14] (/114.88.246.185)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 25 Mar 2020 00:29:40 -0700
To: Hannes Reinecke <hare@suse.de>, Damien Le Moal <Damien.LeMoal@wdc.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
References: <20200324110255.8385-1-bob.liu@oracle.com>
	<20200324110255.8385-4-bob.liu@oracle.com>
	<CO2PR04MB23438E0AB35CC46732F96085E7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
	<812da9e9-cfd2-ea24-60cb-4af48f476079@suse.de>
From: Bob Liu <bob.liu@oracle.com>
Message-ID: <0e7c5043-4345-b052-7cec-a53cfea340f7@oracle.com>
Date: Wed, 25 Mar 2020 15:29:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <812da9e9-cfd2-ea24-60cb-4af48f476079@suse.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9570
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
	spamscore=0 bulkscore=0
	adultscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003250061
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9570
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=0
	lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
	clxscore=1015 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
	impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003250061
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 25 Mar 2020 04:12:59 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
Subject: Re: [dm-devel] [RFC PATCH v2 3/3] dm zoned: add regular device info
	to metadata
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------2EE09531441FC9B62243DB8E"

This is a multi-part message in MIME format.
--------------2EE09531441FC9B62243DB8E
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by userp2130.oracle.com id
	02P7NBIk042530

On 3/25/20 2:47 PM, Hannes Reinecke wrote:
> On 3/25/20 7:29 AM, Damien Le Moal wrote:
>> On 2020/03/24 20:04, Bob Liu wrote:
>>> This patch implemented metadata support for regular device by:
>>> =C2=A0 - Emulated zone information for regular device.
>>> =C2=A0 - Store metadata at the beginning of regular device.
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | --- zoned device --- | -- regular devi=
ce ||
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ^
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |Metadata
>>> zone 0
>>>
>>> Signed-off-by: Bob Liu <bob.liu@oracle.com>
>>> ---
>>> =C2=A0 drivers/md/dm-zoned-metadata.c | 135 +++++++++++++++++++++++++++=
++++----------
>>> =C2=A0 drivers/md/dm-zoned-target.c=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
>>> =C2=A0 drivers/md/dm-zoned.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
>>> =C2=A0 3 files changed, 108 insertions(+), 36 deletions(-)
>>>
> Having thought about it some more, I think we cannot continue with this '=
simple' approach.
> The immediate problem is that we lie about the disk size; clearly the
> metadata cannot be used for regular data, yet we expose a target device w=
ith the full size of the underlying device.

The exposed size is "regular dev size + zoned dev size - metadata size - re=
served seq zone size".
I didn't see why there is a lie?

> Making me wonder if anybody ever tested a disk-full scenario...
> The other problem is that with two devices we need to be able to stitch t=
hem together in an automated fashion, eg via a systemd service or udev rule=
.
> But for this we need to be able to identify the devices, which means both=
 need to carry metadata, and both need to have unique identifier within the=
 metadata. Which the current metadata doesn't allow to.
>=20
> Hence my plan is to implement a v2 metadata, carrying UUIDs for the dmz s=
et _and_ the component device. With that we can update blkid to create link=
s etc so that the devices can be identified in the system.
> Additionally I would be updating dmzadm to write the new metadata.
>=20
> And I will add a new command 'start' to dmzadm which will then create the=
 device-mapper device _with the correct size_. It also has the benefit that=
 we can create the device-mapper target with the UUID specified in the meta=
data, so the persistent device links will be created automatically.
>=20
> Bob, can you send me your improvements to dmzadm so that I can include th=
em in my changes?
>=20

Attached, but it's a big patch I haven't split them to smaller one.
The dmz_check/repair can't work neither in current stage.

--------------2EE09531441FC9B62243DB8E
Content-Type: text/x-patch; name=dm-zoned-tools.patch; charset=WINDOWS-1252
Content-Disposition: attachment;
 filename="dm-zoned-tools.patch"
Content-Transfer-Encoding: quoted-printable

diff --git a/src/dmz.h b/src/dmz.h
index 57741b1..51b5019 100644
--- a/src/dmz.h
+++ b/src/dmz.h
@@ -153,19 +153,33 @@ enum dmz_op {
 =09DMZ_OP_REPAIR,
 };
=20
+struct dmz_raw_dev {
+=09char *path;
+=09char *name;
+=09int fd;
+=09size_t=09=09zone_nr_sectors;
+=09size_t=09=09zone_nr_blocks;
+=09/* Device info */
+=09__u64=09=09capacity;
+=09unsigned int nr_zones;
+=09struct blk_zone=09*zones;
+=09struct dmz_dev *pdev;
+};
+
 /*
  * Device descriptor.
  */
 struct dmz_dev {
=20
 =09/* Device file path and basename */
-=09char=09=09*path;
-=09char=09=09*name;
+=09struct dmz_raw_dev zoned_dev;
+=09struct dmz_raw_dev regu_dev;
+
 =09int=09=09op;
 =09unsigned int=09flags;
+=09size_t=09=09zone_nr_blocks;
+=09int =09=09has_regular;
=20
-=09/* Device info */
-=09__u64=09=09capacity;
=20
 =09unsigned int=09nr_zones;
 =09unsigned int=09nr_meta_zones;
@@ -178,11 +192,6 @@ struct dmz_dev {
 =09unsigned int=09total_nr_meta_zones;
 =09unsigned int=09nr_rnd_zones;
=20
-=09struct blk_zone=09*zones;
-
-=09size_t=09=09zone_nr_sectors;
-=09size_t=09=09zone_nr_blocks;
-
 =09/* First metadata zone */
 =09struct blk_zone=09*sb_zone;
 =09__u64=09=09sb_block;
@@ -195,10 +204,6 @@ struct dmz_dev {
 =09/* Mapping table */
 =09unsigned int=09nr_map_blocks;
 =09__u64=09=09map_block;
-
-=09/* Device file descriptor */
-=09int=09=09fd;
-
 };
=20
 /*
@@ -317,16 +322,16 @@ dmz_zone_cond_str(struct blk_zone *zone)
=20
 extern int dmz_open_dev(struct dmz_dev *dev, enum dmz_op op);
 extern void dmz_close_dev(struct dmz_dev *dev);
-extern int dmz_sync_dev(struct dmz_dev *dev);
-extern int dmz_reset_zone(struct dmz_dev *dev, struct blk_zone *zone);
-extern int dmz_reset_zones(struct dmz_dev *dev);
-extern int dmz_write_block(struct dmz_dev *dev, __u64 block, __u8 *buf);
-extern int dmz_read_block(struct dmz_dev *dev, __u64 block, __u8 *buf);
+extern int dmz_sync_dev(struct dmz_raw_dev *dev);
+extern int dmz_reset_zone(struct dmz_raw_dev *dev, struct blk_zone *zone);
+extern int dmz_reset_zones(struct dmz_raw_dev *dev);
+extern int dmz_write_block(struct dmz_raw_dev *dev, __u64 block, __u8 *buf=
);
+extern int dmz_read_block(struct dmz_raw_dev *dev, __u64 block, __u8 *buf)=
;
=20
 extern __u32 dmz_crc32(__u32 crc, const void *address, size_t length);
=20
 extern int dmz_locate_metadata(struct dmz_dev *dev);
-extern int dmz_write_super(struct dmz_dev *dev, __u64 gen, __u64 offset);
+extern int dmz_write_super(struct dmz_raw_dev *dev, __u64 gen, __u64 offse=
t);
 extern int dmz_format(struct dmz_dev *dev);
 extern int dmz_check(struct dmz_dev *dev);
 extern int dmz_repair(struct dmz_dev *dev);
diff --git a/src/dmz_check.c b/src/dmz_check.c
index 25ce026..da8c1a5 100644
--- a/src/dmz_check.c
+++ b/src/dmz_check.c
@@ -29,7 +29,7 @@
 #include <linux/fs.h>
 #include <assert.h>
 #include <asm/byteorder.h>
-
+#if 0
 /*
  * Message macro.
  */
@@ -1245,4 +1245,4 @@ int dmz_repair(struct dmz_dev *dev)
=20
 =09return 0;
 }
-
+#endif
diff --git a/src/dmz_dev.c b/src/dmz_dev.c
index e713ae0..a7a57ac 100644
--- a/src/dmz_dev.c
+++ b/src/dmz_dev.c
@@ -36,7 +36,7 @@
 /*
  * Test if the device is mounted.
  */
-static int dmz_dev_mounted(struct dmz_dev *dev)
+static int dmz_dev_mounted(struct dmz_raw_dev *dev)
 {
 =09struct mntent *mnt =3D NULL;
 =09FILE *file =3D NULL;
@@ -57,7 +57,7 @@ static int dmz_dev_mounted(struct dmz_dev *dev)
 /*
  * Test if the device is already used as a target backend.
  */
-static int dmz_dev_busy(struct dmz_dev *dev)
+static int dmz_dev_busy(struct dmz_raw_dev *dev)
 {
 =09char path[128];
 =09struct dirent **namelist;
@@ -87,7 +87,7 @@ static int dmz_dev_busy(struct dmz_dev *dev)
 /*
  * Get a zoned block device model (host-aware or howt-managed).
  */
-static int dmz_get_dev_model(struct dmz_dev *dev)
+static int dmz_get_dev_model(struct dmz_raw_dev *dev)
 {
 =09char str[PATH_MAX];
 =09FILE *file;
@@ -122,9 +122,9 @@ static int dmz_get_dev_model(struct dmz_dev *dev)
 =09}
=20
 =09if (strcmp(str, "host-aware") =3D=3D 0)
-=09=09dev->flags |=3D DMZ_ZONED_HA;
+=09=09dev->pdev->flags |=3D DMZ_ZONED_HA;
 =09else if (strcmp(str, "host-managed") =3D=3D 0)
-=09=09dev->flags |=3D DMZ_ZONED_HM;
+=09=09dev->pdev->flags |=3D DMZ_ZONED_HM;
=20
 =09return 0;
 }
@@ -132,7 +132,7 @@ static int dmz_get_dev_model(struct dmz_dev *dev)
 /*
  * Get device capacity and zone size.
  */
-static int dmz_get_dev_capacity(struct dmz_dev *dev)
+static int dmz_get_dev_capacity(struct dmz_raw_dev *dev, int emulated)
 {
 =09char str[128];
 =09FILE *file;
@@ -147,26 +147,30 @@ static int dmz_get_dev_capacity(struct dmz_dev *dev)
 =09}
 =09dev->capacity >>=3D 9;
=20
-=09/* Get zone size */
-=09snprintf(str, sizeof(str),
-=09=09 "/sys/block/%s/queue/chunk_sectors",
-=09=09 dev->name);
-=09file =3D fopen(str, "r");
-=09if (!file) {
-=09=09fprintf(stderr, "Open %s failed\n", str);
-=09=09return -1;
-=09}
+=09if (emulated) {
+=09=09dev->zone_nr_sectors =3D emulated;
+=09} else {
+=09=09/* Get zone size */
+=09=09snprintf(str, sizeof(str),
+=09=09=09=09"/sys/block/%s/queue/chunk_sectors",
+=09=09=09=09dev->name);
+=09=09file =3D fopen(str, "r");
+=09=09if (!file) {
+=09=09=09fprintf(stderr, "Open %s failed\n", str);
+=09=09=09return -1;
+=09=09}
=20
-=09memset(str, 0, sizeof(str));
-=09res =3D fscanf(file, "%s", str);
-=09fclose(file);
+=09=09memset(str, 0, sizeof(str));
+=09=09res =3D fscanf(file, "%s", str);
+=09=09fclose(file);
=20
-=09if (res !=3D 1) {
-=09=09fprintf(stderr, "Invalid file %s format\n", str);
-=09=09return -1;
-=09}
+=09=09if (res !=3D 1) {
+=09=09=09fprintf(stderr, "Invalid file %s format\n", str);
+=09=09=09return -1;
+=09=09}
=20
-=09dev->zone_nr_sectors =3D atol(str);
+=09=09dev->zone_nr_sectors =3D atol(str);
+=09}
 =09if (!dev->zone_nr_sectors ||
 =09    (dev->zone_nr_sectors & DMZ_BLOCK_SECTORS_MASK)) {
 =09=09fprintf(stderr,
@@ -182,7 +186,7 @@ static int dmz_get_dev_capacity(struct dmz_dev *dev)
 /*
  * Print a device zone information.
  */
-static void dmz_print_zone(struct dmz_dev *dev,
+static void dmz_print_zone(struct dmz_raw_dev *dev,
 =09=09=09   struct blk_zone *zone)
 {
=20
@@ -230,14 +234,14 @@ static void dmz_print_zone(struct dmz_dev *dev,
 /*
  * Get a device zone configuration.
  */
-static int dmz_get_dev_zones(struct dmz_dev *dev)
+static int dmz_get_dev_zones(struct dmz_raw_dev *dev, int emulate)
 {
 =09struct blk_zone_report *rep =3D NULL;
 =09unsigned int rep_max_zones;
 =09struct blk_zone *blkz;
 =09unsigned int i, nr_zones;
 =09__u64 sector;
-=09int ret =3D -1;
+=09int ret =3D 0;
=20
 =09/* This will ignore an eventual last smaller zone */
 =09nr_zones =3D dev->capacity / dev->zone_nr_sectors;
@@ -263,17 +267,35 @@ static int dmz_get_dev_zones(struct dmz_dev *dev)
=20
 =09sector =3D 0;
 =09while (sector < dev->capacity) {
-
 =09=09/* Get zone information */
 =09=09memset(rep, 0, DMZ_REPORT_ZONES_BUFSZ);
 =09=09rep->sector =3D sector;
 =09=09rep->nr_zones =3D rep_max_zones;
-=09=09ret =3D ioctl(dev->fd, BLKREPORTZONE, rep);
-=09=09if (ret !=3D 0) {
-=09=09=09fprintf(stderr,
-=09=09=09=09"%s: Get zone information failed %d (%s)\n",
-=09=09=09=09dev->name, errno, strerror(errno));
-=09=09=09goto out;
+=09=09if (emulate) {
+=09=09=09unsigned int f_sector =3D sector;
+=09=09=09rep->nr_zones =3D ((nr_zones < rep_max_zones) ? nr_zones : rep_ma=
x_zones);
+=09=09=09blkz =3D (struct blk_zone *)(rep + 1);
+=09=09=09for (i =3D 0; i < rep->nr_zones && f_sector < dev->capacity; i++)=
 {
+=09=09=09=09//set up fake blkz
+=09=09=09=09blkz->start =3D f_sector;
+=09=09=09=09blkz->len =3D dev->zone_nr_sectors;
+=09=09=09=09blkz->wp =3D blkz->start + blkz->len;
+=09=09=09=09blkz->type =3D BLK_ZONE_TYPE_CONVENTIONAL;
+=09=09=09=09blkz->cond =3D BLK_ZONE_COND_NOT_WP;
+
+=09=09=09=09f_sector =3D dmz_zone_sector(blkz) + dmz_zone_length(blkz);
+=09=09=09=09if (f_sector > dev->capacity)
+=09=09=09=09=09blkz->len =3D dev->capacity - dmz_zone_sector(blkz);
+=09=09=09=09blkz++;
+=09=09=09}
+=09=09} else {
+=09=09=09ret =3D ioctl(dev->fd, BLKREPORTZONE, rep);
+=09=09=09if (ret !=3D 0) {
+=09=09=09=09fprintf(stderr,
+=09=09=09=09=09=09"%s: Get zone information failed %d (%s)\n",
+=09=09=09=09=09=09dev->name, errno, strerror(errno));
+=09=09=09=09goto out;
+=09=09=09}
 =09=09}
=20
 =09=09if (!rep->nr_zones)
@@ -282,7 +304,7 @@ static int dmz_get_dev_zones(struct dmz_dev *dev)
 =09=09blkz =3D (struct blk_zone *)(rep + 1);
 =09=09for (i =3D 0; i < rep->nr_zones && sector < dev->capacity; i++) {
=20
-=09=09=09if (dev->flags & DMZ_VVERBOSE)
+=09=09=09if (dev->pdev->flags & DMZ_VVERBOSE)
 =09=09=09=09dmz_print_zone(dev, blkz);
=20
 =09=09=09/* Check zone size */
@@ -337,22 +359,35 @@ out:
 static int dmz_get_dev_info(struct dmz_dev *dev)
 {
=20
-=09if (dmz_get_dev_model(dev) < 0)
+=09if (dmz_get_dev_model(&dev->zoned_dev) < 0)
 =09=09return -1;
=20
 =09if (!dmz_dev_is_zoned(dev)) {
 =09=09fprintf(stderr,
 =09=09=09"%s: Not a zoned block device\n",
-=09=09=09dev->name);
+=09=09=09dev->zoned_dev.name);
 =09=09return -1;
 =09}
=20
-=09if (dmz_get_dev_capacity(dev) < 0)
+=09if (dmz_get_dev_capacity(&dev->zoned_dev, 0) < 0)
 =09=09return -1;
=20
-=09if (dmz_get_dev_zones(dev) < 0)
+=09dev->zone_nr_blocks =3D dev->zoned_dev.zone_nr_blocks;
+=09if (dev->has_regular)
+=09=09if (dmz_get_dev_capacity(&dev->regu_dev, dev->zoned_dev.zone_nr_bloc=
ks) < 0)
+=09=09=09return -1;
+
+=09if (dmz_get_dev_zones(&dev->zoned_dev, 0) < 0)
 =09=09return -1;
=20
+=09if (dev->has_regular)
+=09=09if (dmz_get_dev_zones(&dev->regu_dev, 1) < 0)
+=09=09=09return -1;
+
+=09dev->nr_zones =3D dev->zoned_dev.nr_zones;
+=09if (dev->has_regular)
+=09=09dev->nr_zones +=3D dev->regu_dev.nr_zones;
+
 =09return 0;
 }
=20
@@ -361,7 +396,7 @@ static int dmz_get_dev_info(struct dmz_dev *dev)
  * Return -1 on error, 0 if something valid is detected on the disk
  * and 1 if the disk appears to be unused.
  */
-static int dmz_check_overwrite(struct dmz_dev *dev)
+static int dmz_check_overwrite(struct dmz_raw_dev *dev)
 {
 =09const char *type;
 =09blkid_probe pr;
@@ -421,10 +456,7 @@ out:
 =09return ret;
 }
=20
-/*
- * Open a device.
- */
-int dmz_open_dev(struct dmz_dev *dev, enum dmz_op op)
+int dmz_open_raw_dev(struct dmz_raw_dev *dev, enum dmz_op op, int flags)
 {
 =09struct stat st;
 =09int ret;
@@ -447,7 +479,7 @@ int dmz_open_dev(struct dmz_dev *dev, enum dmz_op op)
 =09=09return -1;
 =09}
=20
-=09if (op =3D=3D DMZ_OP_FORMAT && (!(dev->flags & DMZ_OVERWRITE))) {
+=09if (op =3D=3D DMZ_OP_FORMAT && (!(flags & DMZ_OVERWRITE))) {
 =09=09/* Check for existing valid content */
 =09=09ret =3D dmz_check_overwrite(dev);
 =09=09if (ret <=3D 0)
@@ -455,16 +487,12 @@ int dmz_open_dev(struct dmz_dev *dev, enum dmz_op op)
 =09}
=20
 =09if (dmz_dev_mounted(dev)) {
-=09=09fprintf(stderr,
-=09=09=09"%s is mounted\n",
-=09=09=09dev->path);
+=09=09fprintf(stderr, "%s is mounted\n", dev->path);
 =09=09return -1;
 =09}
=20
 =09if (dmz_dev_busy(dev)) {
-=09=09fprintf(stderr,
-=09=09=09"%s is in use\n",
-=09=09=09dev->path);
+=09=09fprintf(stderr, "%s is in use\n", dev->path);
 =09=09return -1;
 =09}
=20
@@ -478,6 +506,18 @@ int dmz_open_dev(struct dmz_dev *dev, enum dmz_op op)
 =09=09return -1;
 =09}
=20
+=09return 0;
+}
+
+/*
+ * Open a device.
+ */
+int dmz_open_dev(struct dmz_dev *dev, enum dmz_op op)
+{
+=09dmz_open_raw_dev(&dev->zoned_dev, op, dev->flags);
+=09if (dev->has_regular)
+=09=09dmz_open_raw_dev(&dev->regu_dev, op, dev->flags);
+
 =09/* Get device capacity and zone configuration */
 =09if (dmz_get_dev_info(dev) < 0) {
 =09=09dmz_close_dev(dev);
@@ -487,10 +527,7 @@ int dmz_open_dev(struct dmz_dev *dev, enum dmz_op op)
 =09return 0;
 }
=20
-/*
- * Close an open device.
- */
-void dmz_close_dev(struct dmz_dev *dev)
+void dmz_close_raw_dev(struct dmz_raw_dev *dev)
 {
 =09if (dev->fd >=3D 0) {
 =09=09close(dev->fd);
@@ -501,10 +538,20 @@ void dmz_close_dev(struct dmz_dev *dev)
 =09dev->zones =3D NULL;
 }
=20
+/*
+ * Close an open device.
+ */
+void dmz_close_dev(struct dmz_dev *dev)
+{
+=09dmz_close_raw_dev(&dev->zoned_dev);
+=09if (dev->has_regular)
+=09=09dmz_close_raw_dev(&dev->regu_dev);
+}
+
 /*
  * Read a metadata block.
  */
-int dmz_read_block(struct dmz_dev *dev, __u64 block, __u8 *buf)
+int dmz_read_block(struct dmz_raw_dev *dev, __u64 block, __u8 *buf)
 {
 =09ssize_t ret;
=20
@@ -526,7 +573,7 @@ int dmz_read_block(struct dmz_dev *dev, __u64 block, __=
u8 *buf)
 /*
  * Write a metadata block.
  */
-int dmz_write_block(struct dmz_dev *dev, __u64 block, __u8 *buf)
+int dmz_write_block(struct dmz_raw_dev *dev, __u64 block, __u8 *buf)
 {
 =09ssize_t ret;
=20
@@ -547,7 +594,7 @@ int dmz_write_block(struct dmz_dev *dev, __u64 block, _=
_u8 *buf)
 /*
  * Write a metadata block.
  */
-int dmz_sync_dev(struct dmz_dev *dev)
+int dmz_sync_dev(struct dmz_raw_dev *dev)
 {
=20
 =09printf("Syncing disk\n");
diff --git a/src/dmz_format.c b/src/dmz_format.c
index 62cb03b..30286cb 100644
--- a/src/dmz_format.c
+++ b/src/dmz_format.c
@@ -24,14 +24,14 @@
=20
 #include <sys/types.h>
 #include <asm/byteorder.h>
-
 /*
  * Fill and write a super block.
  */
-int dmz_write_super(struct dmz_dev *dev,
+int dmz_write_super(struct dmz_raw_dev *dev,
 =09=09    __u64 gen, __u64 offset)
 {
-=09__u64 sb_block =3D dev->sb_block + offset;
+=09struct dmz_dev *pdev =3D dev->pdev;
+=09__u64 sb_block =3D pdev->sb_block + offset;
 =09struct dm_zoned_super *sb;
 =09__u32 crc;
 =09__u8 *buf;
@@ -52,12 +52,12 @@ int dmz_write_super(struct dmz_dev *dev,
 =09sb->gen =3D __cpu_to_le64(gen);
=20
 =09sb->sb_block =3D __cpu_to_le64(sb_block);
-=09sb->nr_meta_blocks =3D __cpu_to_le32(dev->nr_meta_blocks);
-=09sb->nr_reserved_seq =3D __cpu_to_le32(dev->nr_reserved_seq);
-=09sb->nr_chunks =3D __cpu_to_le32(dev->nr_chunks);
+=09sb->nr_meta_blocks =3D __cpu_to_le32(pdev->nr_meta_blocks);
+=09sb->nr_reserved_seq =3D __cpu_to_le32(pdev->nr_reserved_seq);
+=09sb->nr_chunks =3D __cpu_to_le32(pdev->nr_chunks);
=20
-=09sb->nr_map_blocks =3D __cpu_to_le32(dev->nr_map_blocks);
-=09sb->nr_bitmap_blocks =3D __cpu_to_le32(dev->nr_bitmap_blocks);
+=09sb->nr_map_blocks =3D __cpu_to_le32(pdev->nr_map_blocks);
+=09sb->nr_bitmap_blocks =3D __cpu_to_le32(pdev->nr_bitmap_blocks);
=20
 =09crc =3D dmz_crc32(gen, sb, DMZ_BLOCK_SIZE);
 =09sb->crc =3D __cpu_to_le32(crc);
@@ -77,7 +77,7 @@ int dmz_write_super(struct dmz_dev *dev,
 /*
  * Write mapping table blocks.
  */
-static int dmz_write_mapping(struct dmz_dev *dev,
+static int dmz_write_mapping(struct dmz_raw_dev *dev,
 =09=09=09     __u64 offset)
 {
 =09__u64 map_block;
@@ -102,8 +102,8 @@ static int dmz_write_mapping(struct dmz_dev *dev,
 =09}
=20
 =09/* Write mapping table */
-=09map_block =3D offset + dev->map_block;
-=09for (i =3D 0; i < dev->nr_map_blocks; i++) {
+=09map_block =3D offset + dev->pdev->map_block;
+=09for (i =3D 0; i < dev->pdev->nr_map_blocks; i++) {
 =09=09ret =3D dmz_write_block(dev, map_block + i, buf);
 =09=09if (ret < 0) {
 =09=09=09fprintf(stderr,
@@ -122,7 +122,7 @@ static int dmz_write_mapping(struct dmz_dev *dev,
 /*
  * Write zone bitmap blocks.
  */
-static int dmz_write_bitmap(struct dmz_dev *dev,
+static int dmz_write_bitmap(struct dmz_raw_dev *dev,
 =09=09=09    __u64 offset)
 {
 =09__u64 bitmap_block;
@@ -140,8 +140,8 @@ static int dmz_write_bitmap(struct dmz_dev *dev,
 =09memset(buf, 0, DMZ_BLOCK_SIZE);
=20
 =09/* Clear bitmap blocks */
-=09bitmap_block =3D offset + dev->bitmap_block;
-=09for (i =3D 0; i < dev->nr_bitmap_blocks; i++) {
+=09bitmap_block =3D offset + dev->pdev->bitmap_block;
+=09for (i =3D 0; i < dev->pdev->nr_bitmap_blocks; i++) {
 =09=09ret =3D dmz_write_block(dev, bitmap_block + i, buf);
 =09=09if (ret < 0) {
 =09=09=09fprintf(stderr,
@@ -160,7 +160,7 @@ static int dmz_write_bitmap(struct dmz_dev *dev,
 /*
  * Write formatted metadata blocks.
  */
-static int dmz_write_meta(struct dmz_dev *dev,
+static int dmz_write_meta(struct dmz_raw_dev *dev,
 =09=09=09  __u64 offset)
 {
=20
@@ -180,11 +180,20 @@ static int dmz_write_meta(struct dmz_dev *dev,
 =09return 0;
 }
=20
+struct dmz_raw_dev *dmz_metadev(struct dmz_dev *dev)
+{
+=09if (dev->has_regular)
+=09=09return &dev->regu_dev;
+=09else
+=09=09return &dev->zoned_dev;
+}
+
 /*
  * Format a device.
  */
 int dmz_format(struct dmz_dev *dev)
 {
+=09struct dmz_raw_dev *mdev =3D dmz_metadev(dev);
=20
 =09/* calculate location of metadata blocks */
 =09if (dmz_locate_metadata(dev) < 0)
@@ -199,7 +208,7 @@ int dmz_format(struct dmz_dev *dev)
 =09=09printf("  Primary meta-data set: %u metadata blocks from block %llu =
(zone %u)\n",
 =09=09       dev->nr_meta_blocks,
 =09=09       dev->sb_block,
-=09=09       dmz_zone_id(dev, dev->sb_zone));
+=09=09       dmz_zone_id(mdev, dev->sb_zone));
 =09=09printf("    Super block at block %llu and %llu\n",
 =09=09       dev->sb_block,
 =09=09       dev->sb_block + (dev->nr_meta_zones * dev->zone_nr_blocks));
@@ -231,25 +240,27 @@ int dmz_format(struct dmz_dev *dev)
=20
 =09/* Ready to write: first reset all zones */
 =09printf("Resetting sequential zones\n");
-=09if (dmz_reset_zones(dev) < 0)
+=09if (dev->has_regular)
+=09=09if (dmz_reset_zones(&dev->regu_dev) < 0)
+=09=09=09return -1;
+=09if (dmz_reset_zones(&dev->zoned_dev) < 0)
 =09=09return -1;
=20
 =09/* Write primary metadata set */
 =09printf("Writing primary metadata set\n");
-=09if (dmz_write_meta(dev, 0) < 0)
+=09if (dmz_write_meta(mdev, 0) < 0)
 =09=09return -1;
=20
 =09/* Write secondary metadata set */
 =09printf("Writing secondary metadata set\n");
-=09if (dmz_write_meta(dev, dev->zone_nr_blocks * dev->nr_meta_zones) < 0)
+=09if (dmz_write_meta(mdev, dev->zone_nr_blocks * dev->nr_meta_zones) < 0)
 =09=09return -1;
=20
 =09/* Sync */
-=09if (dmz_sync_dev(dev) < 0)
+=09if (dmz_sync_dev(mdev) < 0)
 =09=09return -1;
=20
 =09printf("Done.\n");
=20
 =09return 0;
 }
-
diff --git a/src/dmz_lib.c b/src/dmz_lib.c
index 2df0758..3c1874a 100644
--- a/src/dmz_lib.c
+++ b/src/dmz_lib.c
@@ -44,7 +44,7 @@ __u32 dmz_crc32(__u32 crc, const void *buf, size_t length=
)
 /*
  * Reset a zone.
  */
-int dmz_reset_zone(struct dmz_dev *dev,
+int dmz_reset_zone(struct dmz_raw_dev *dev,
 =09=09   struct blk_zone *zone)
 {
 =09struct blk_zone_range range;
@@ -73,7 +73,7 @@ int dmz_reset_zone(struct dmz_dev *dev,
 /*
  * Reset all zones of a device.
  */
-int dmz_reset_zones(struct dmz_dev *dev)
+int dmz_reset_zones(struct dmz_raw_dev *dev)
 {
 =09unsigned int i;
=20
@@ -85,21 +85,10 @@ int dmz_reset_zones(struct dmz_dev *dev)
 =09return 0;
 }
=20
-/*
- * Determine location and amount of metadata blocks.
- */
-int dmz_locate_metadata(struct dmz_dev *dev)
+static void count_useable_zones(struct dmz_raw_dev *dev)
 {
 =09struct blk_zone *zone;
 =09unsigned int i =3D 0;
-=09unsigned int nr_meta_blocks, nr_map_blocks;
-=09unsigned int nr_chunks, nr_meta_zones;
-=09unsigned int nr_bitmap_zones;
-
-=09dev->nr_useable_zones =3D 0;
-=09dev->max_nr_meta_zones =3D 0;
-=09dev->last_meta_zone =3D 0;
-=09dev->nr_rnd_zones =3D 0;
=20
 =09/* Count useable zones */
 =09for (i =3D 0; i < dev->nr_zones; i++) {
@@ -126,21 +115,43 @@ int dmz_locate_metadata(struct dmz_dev *dev)
 =09=09=09       dmz_zone_id(dev, zone));
 =09=09=09continue;
 =09=09}
-=09=09dev->nr_useable_zones++;
+=09=09dev->pdev->nr_useable_zones++;
=20
 =09=09if (dmz_zone_rnd(zone)) {
-=09=09=09if (dev->sb_zone =3D=3D NULL) {
-=09=09=09=09dev->sb_zone =3D zone;
-=09=09=09=09dev->last_meta_zone =3D i;
-=09=09=09=09dev->max_nr_meta_zones =3D 1;
-=09=09=09} else if (dev->last_meta_zone =3D=3D (i - 1)) {
-=09=09=09=09dev->last_meta_zone =3D i;
-=09=09=09=09dev->max_nr_meta_zones++;
+=09=09=09if (dev->pdev->sb_zone =3D=3D NULL) {
+=09=09=09=09dev->pdev->sb_zone =3D zone;
+=09=09=09=09dev->pdev->last_meta_zone =3D i;
+=09=09=09=09dev->pdev->max_nr_meta_zones =3D 1;
+=09=09=09} else if (dev->pdev->last_meta_zone =3D=3D (i - 1)) {
+=09=09=09=09dev->pdev->last_meta_zone =3D i;
+=09=09=09=09dev->pdev->max_nr_meta_zones++;
 =09=09=09}
-=09=09=09dev->nr_rnd_zones++;
+=09=09=09dev->pdev->nr_rnd_zones++;
 =09=09}
-
 =09}
+}
+
+/*
+ * Determine location and amount of metadata blocks.
+ */
+int dmz_locate_metadata(struct dmz_dev *dev)
+{
+=09unsigned int nr_meta_blocks, nr_map_blocks;
+=09unsigned int nr_chunks, nr_meta_zones;
+=09unsigned int nr_bitmap_zones;
+
+=09dev->nr_useable_zones =3D 0;
+=09dev->max_nr_meta_zones =3D 0;
+=09dev->last_meta_zone =3D 0;
+=09dev->nr_rnd_zones =3D 0;
+
+=09/*
+=09 * Count regular device first, so that metadata zone will be in
+=09 * regular device.
+=09 */
+=09if (dev->has_regular)
+=09=09count_useable_zones(&dev->regu_dev);
+=09count_useable_zones(&dev->zoned_dev);
=20
 =09/*
 =09 * Randomly writeable zones are mandatory: at least 3
@@ -148,8 +159,8 @@ int dmz_locate_metadata(struct dmz_dev *dev)
 =09 */
 =09if (dev->nr_rnd_zones < 3) {
 =09=09fprintf(stderr,
-=09=09=09"%s: Not enough random zones found\n",
-=09=09=09dev->name);
+=09=09=09"%s:%s: Not enough random zones found\n",
+=09=09=09dev->zoned_dev.name, dev->regu_dev.name);
 =09=09return -1;
 =09}
=20
@@ -161,8 +172,8 @@ int dmz_locate_metadata(struct dmz_dev *dev)
 =09=09dev->nr_reserved_seq =3D dev->nr_rnd_zones - 1;
 =09if (dev->nr_reserved_seq >=3D dev->nr_useable_zones) {
 =09=09fprintf(stderr,
-=09=09=09"%s: Not enough useable zones found\n",
-=09=09=09dev->name);
+=09=09=09"%s:%s: Not enough useable zones found\n",
+=09=09=09dev->zoned_dev.name, dev->regu_dev.name);
 =09=09return -1;
 =09}
=20
@@ -181,8 +192,8 @@ int dmz_locate_metadata(struct dmz_dev *dev)
=20
 =09if ((nr_bitmap_zones + dev->nr_reserved_seq) > dev->nr_useable_zones) {
 =09=09fprintf(stderr,
-=09=09=09"%s: Not enough zones\n",
-=09=09=09dev->name);
+=09=09=09"%s:%s: Not enough zones\n",
+=09=09=09dev->zoned_dev.name, dev->regu_dev.name);
 =09=09return -1;
 =09}
=20
@@ -208,9 +219,9 @@ int dmz_locate_metadata(struct dmz_dev *dev)
=20
 =09if (dev->total_nr_meta_zones > dev->nr_rnd_zones) {
 =09=09fprintf(stderr,
-=09=09=09"%s: Insufficient number of random zones "
+=09=09=09"%s:%s Insufficient number of random zones "
 =09=09=09"(need %u, have %u)\n",
-=09=09=09dev->name,
+=09=09=09dev->zoned_dev.name, dev->regu_dev.name,
 =09=09=09dev->total_nr_meta_zones,
 =09=09=09dev->nr_rnd_zones);
 =09=09return -1;
diff --git a/src/dmzadm.c b/src/dmzadm.c
index 0660d02..ff7e9cc 100644
--- a/src/dmzadm.c
+++ b/src/dmzadm.c
@@ -41,23 +41,55 @@ static void dmzadm_usage(void)
 =09       "  --force=09: Force overwrite of existing content\n"
 =09       "  --seq <num>=09: Number of sequential zones reserved\n"
 =09       "                  for reclaim. The minimum is 1 and the\n"
-=09       "                  default is %d\n",
+=09       "                  default is %d\n"
+=09       "  --regular <device path>: Use a regular block device\n"
+=09       "                  for metadata and buffer writes\n",
 =09       DMZ_NR_RESERVED_SEQ);
 }
=20
+static void dump_info(struct dmz_raw_dev *dev)
+{
+=09unsigned int nr_zones;
+=09struct dmz_dev *pdev =3D dev->pdev;
+
+=09printf("%s: %llu 512-byte sectors (%llu GiB)\n",
+=09       dev->path,
+=09       dev->capacity,
+=09       (dev->capacity << 9) / (1024ULL * 1024ULL * 1024ULL));
+=09printf("  Host-%s device\n",
+=09       (pdev->flags & DMZ_ZONED_HM) ? "managed" : "aware");
+=09nr_zones =3D dev->capacity / dev->zone_nr_sectors;
+=09printf("  %u zones of %zu 512-byte sectors (%zu MiB)\n",
+=09       nr_zones,
+=09       dev->zone_nr_sectors,
+=09       (dev->zone_nr_sectors << 9) / (1024 * 1024));
+=09if (nr_zones < dev->nr_zones) {
+=09=09size_t runt_sectors =3D dev->capacity & (dev->zone_nr_sectors - 1);
+
+=09=09printf("  1 runt zone of %zu 512-byte sectors (%zu MiB)\n",
+=09=09       runt_sectors,
+=09=09       (runt_sectors << 9) / (1024 * 1024));
+=09}
+=09printf("  %zu 4KB data blocks per zone\n",
+=09       dev->zone_nr_blocks);
+
+}
+
 /*
  * Main function.
  */
 int main(int argc, char **argv)
 {
-=09unsigned int nr_zones;
 =09struct dmz_dev dev;
-=09int i, ret;
+=09int i, ret =3D 0;
 =09enum dmz_op op;
=20
 =09/* Initialize */
 =09memset(&dev, 0, sizeof(dev));
-=09dev.fd =3D -1;
+=09dev.zoned_dev.fd =3D -1;
+=09dev.regu_dev.fd =3D -1;
+=09dev.zoned_dev.pdev =3D &dev;
+=09dev.regu_dev.pdev =3D &dev;
 =09dev.nr_reserved_seq =3D DMZ_NR_RESERVED_SEQ;
=20
 =09/* Parse operation */
@@ -90,7 +122,7 @@ int main(int argc, char **argv)
 =09}
=20
 =09/* Get device path */
-=09dev.path =3D argv[2];
+=09dev.zoned_dev.path =3D argv[2];
=20
 =09/* Parse arguments */
 =09for (i =3D 3; i < argc; i++) {
@@ -118,7 +150,15 @@ int main(int argc, char **argv)
 =09=09=09=09=09"Invalid number of sequential zones\n");
 =09=09=09=09return 1;
 =09=09=09}
-
+=09=09} else if (strncmp(argv[i], "--regular=3D", 10) =3D=3D 0) {
+=09=09=09if (op !=3D DMZ_OP_FORMAT) {
+=09=09=09=09fprintf(stderr,
+=09=09=09=09=09"--regular option is valid only with the "
+=09=09=09=09=09"format operation\n");
+=09=09=09=09return 1;
+=09=09=09}
+=09=09=09dev.regu_dev.path =3D argv[i] + 10;
+=09=09=09dev.has_regular =3D 1;
 =09=09} else if (strcmp(argv[i], "--force") =3D=3D 0) {
=20
 =09=09=09if (op !=3D DMZ_OP_FORMAT) {
@@ -149,26 +189,9 @@ int main(int argc, char **argv)
 =09if (dmz_open_dev(&dev, op) < 0)
 =09=09return 1;
=20
-=09printf("%s: %llu 512-byte sectors (%llu GiB)\n",
-=09       dev.path,
-=09       dev.capacity,
-=09       (dev.capacity << 9) / (1024ULL * 1024ULL * 1024ULL));
-=09printf("  Host-%s device\n",
-=09       (dev.flags & DMZ_ZONED_HM) ? "managed" : "aware");
-=09nr_zones =3D dev.capacity / dev.zone_nr_sectors;
-=09printf("  %u zones of %zu 512-byte sectors (%zu MiB)\n",
-=09       nr_zones,
-=09       dev.zone_nr_sectors,
-=09       (dev.zone_nr_sectors << 9) / (1024 * 1024));
-=09if (nr_zones < dev.nr_zones) {
-=09=09size_t runt_sectors =3D dev.capacity & (dev.zone_nr_sectors - 1);
-
-=09=09printf("  1 runt zone of %zu 512-byte sectors (%zu MiB)\n",
-=09=09       runt_sectors,
-=09=09       (runt_sectors << 9) / (1024 * 1024));
-=09}
-=09printf("  %zu 4KB data blocks per zone\n",
-=09       dev.zone_nr_blocks);
+=09dump_info(&dev.zoned_dev);
+=09if (dev.has_regular)
+=09=09dump_info(&dev.regu_dev);
=20
 =09switch (op) {
=20
@@ -176,6 +199,7 @@ int main(int argc, char **argv)
 =09=09ret =3D dmz_format(&dev);
 =09=09break;
=20
+#if 0
 =09case DMZ_OP_CHECK:
 =09=09ret =3D dmz_check(&dev);
 =09=09break;
@@ -183,6 +207,7 @@ int main(int argc, char **argv)
 =09case DMZ_OP_REPAIR:
 =09=09ret =3D dmz_repair(&dev);
 =09=09break;
+#endif
=20
 =09default:
=20

--------------2EE09531441FC9B62243DB8E
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--------------2EE09531441FC9B62243DB8E--

