Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 70EDC21273E
	for <lists+dm-devel@lfdr.de>; Thu,  2 Jul 2020 17:02:39 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-C7e6Ov8WPaW6NP2UkccS5w-1; Thu, 02 Jul 2020 11:02:36 -0400
X-MC-Unique: C7e6Ov8WPaW6NP2UkccS5w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4D2C804002;
	Thu,  2 Jul 2020 15:02:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 492D873FEA;
	Thu,  2 Jul 2020 15:02:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E8B6518095FF;
	Thu,  2 Jul 2020 15:02:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 062F0keK014545 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 11:00:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5A5ED20316DD; Thu,  2 Jul 2020 15:00:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FFB8207ADF2
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 15:00:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 454208007AC
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 15:00:44 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [62.140.7.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-429-1sUCTKO_PECiJZhR09UbSw-1;
	Thu, 02 Jul 2020 11:00:41 -0400
X-MC-Unique: 1sUCTKO_PECiJZhR09UbSw-1
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur03lp2055.outbound.protection.outlook.com [104.47.10.55])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-8-C46GYL90PgurNLXaCeLydg-1; Thu, 02 Jul 2020 17:00:39 +0200
X-MC-Unique: C46GYL90PgurNLXaCeLydg-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB3PR0402MB3900.eurprd04.prod.outlook.com (2603:10a6:8:e::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21;
	Thu, 2 Jul 2020 15:00:37 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593%3]) with mapi id 15.20.3131.035;
	Thu, 2 Jul 2020 15:00:37 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 2/4] kpartx: read devices with direct IO
Thread-Index: AQHWT/iJX9QtHEFpck2JAaQNhqAkMaj0YyQA
Date: Thu, 2 Jul 2020 15:00:37 +0000
Message-ID: <14f1d07b336e2939ddcf9fb87be763c4a42f061d.camel@suse.com>
References: <1593643176-6206-1-git-send-email-bmarzins@redhat.com>
	<1593643176-6206-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593643176-6206-3-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3
x-originating-ip: [94.218.227.113]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79a0e23e-7238-4d36-02b7-08d81e98ae0d
x-ms-traffictypediagnostic: DB3PR0402MB3900:
x-microsoft-antispam-prvs: <DB3PR0402MB39002AF97A0BB0788AE4253AFC6D0@DB3PR0402MB3900.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0452022BE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gjJ99in8SHDKMprKuc62qK5CXzm8e7pH5X75kxPPXjYCwU72JmCcKt9QnQdq6cBT4/uJuTMs+UfIyWyOgk9nptOBGjd3SpDNhRFQ6BOwytv0ElK+wo5j/OuIVLUQpevx+Hpap6Bp5JquQ93k1PZrYx+lSTC7x7wJJmDv+vkQeCDbaCUxdnALpumrST2kBvvjON4CqN4V5Qgj6ybBE1SeK9dfoHGh7KwAeK9BsJGy47cugegbPqsw719Ccsoay1mxHajGoZ/q+vNnaiSG/gDY8O/fyLY89b6HJZ0ZTrcRlf4f15A5X5WnX6hKsA2V1Sd0LPXW35jVkZ5D9q7mg5IQaP4vEmcO4OJOswLl/Nf/+R6acs3fcT6KeVFEiLYJ4Ug8ZztKX2yi9tuBRKAiNgrybA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(346002)(366004)(136003)(396003)(39860400002)(376002)(2616005)(64756008)(6512007)(5660300002)(2906002)(76116006)(66556008)(91956017)(86362001)(66476007)(66446008)(66946007)(36756003)(6506007)(4326008)(8936002)(966005)(186003)(8676002)(6486002)(83380400001)(316002)(71200400001)(26005)(478600001)(110136005)(66574015);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: 4hQecb3CGSnXX9baQvq29Mlpf7T2fCt6mrQww8ouzf7CgAHEXyb8Yh6yEvSGJ/B5DCV5w6y9Eli9MoDJEfcRPD8QO4gLr3TTJyfxpdWndRBYfdbwYmbdXF7d2jrB9ppn+83HMIBfS5HMwtsSA6YMqarYyyTSc8mlqX0ks9xp08dHnPbjx8/+qWZseTDPqjc3PN7CwecG4ZNS0EFYxNn5/Ma9wYqXaenE+BYl6hVl+U9JP1QArEggmw3o+8Aill7MV7m8oZkCbfCawC+l5g4wzgcj+I0HCsOb6dBbaoW+2lcg8bv3mY3lXKzms48oGO8BFSFX1PV5HsjJqb9ciiE32G3j6tuhNR9LYoybuJuPAH89Bz0bEmPG70xk/NUcFfzrHvtxbmRmf+9WfaB5eUDayLaCC2y2RKLH0BBxu+dXcTgzFv0osiqLDp5g9jvAcPPPSSQeKcjZyVCf3ICuiFVHSqeeXi6SBJzM/l/75x84DnwoqA17B3CdVyKk1m8U897A
x-ms-exchange-transport-forked: True
Content-ID: <CBC0FE3F5C911547A9F0367573ECD0F1@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a0e23e-7238-4d36-02b7-08d81e98ae0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2020 15:00:37.5446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: izkukuagTAlY57j1gmbv2HJ74GFL0e0jngAAwVjrSWkaHAo6VLoK1D1CB3GM4lpyrqCDYNz2NGCO8upzuoWPog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3900
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 062F0keK014545
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/4] kpartx: read devices with direct IO
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-07-01 at 17:39 -0500, Benjamin Marzinski wrote:
> If kpartx is used on top of shared storage, and a device has its
> partition table changed on one machine, and then kpartx is run on
> another, it may not see the new data, because the cache still
> contains
> the old data, and there is nothing to tell the machine running kpartx
> to
> invalidate it. To solve this, kpartx should read the devices using
> direct io.
>=20
> One issue with how this code has been updated is that the original
> code
> for getblock() always read 1024 bytes. The new code reads a logical
> sector size chunk of the device, and returns a pointer to the 512
> byte
> sector that the caller asked for, within that (possibly larger)
> chunk.
> This means that if the logical sector size is 512, then the code is
> now
> only reading 512 bytes.  Looking through the code for the various
> partition types, I can't see a case where more than 512 bytes is
> needed
> and getblock() is used.  If anyone has a reason why this code should
> be
> reading 1024 bytes at minmum, I can certainly change this.  But when
> I
> looked, I couldn't find a case where reading 512 bytes would cause a
> problem.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

The value 1024 comes from first partx in util-linux, where Christophe=20
pulled the first kpartx from:=20
http://ftp.be.debian.org/pub/linux/utils/util-linux/v2.10/util-linux-2.10m.=
tar.gz=20
I, too, see no reason for reading more than a single block.

Two nits below. Here's one more, I'd have preferred two separate
patches for these two different issues. But never mind.

Regards,
Martin

> ---
>  kpartx/dasd.c   |  7 ++++---
>  kpartx/gpt.c    | 22 ++++++++++------------
>  kpartx/kpartx.c | 46 +++++++++++++++++++++++++++++++++++-----------
>  kpartx/kpartx.h |  2 ++
>  4 files changed, 51 insertions(+), 26 deletions(-)
>=20
> diff --git a/kpartx/dasd.c b/kpartx/dasd.c
> index 14b9d3aa..f0398645 100644
> --- a/kpartx/dasd.c
> +++ b/kpartx/dasd.c
> @@ -22,6 +22,7 @@
>   * along with this program.  If not, see <
> http://www.gnu.org/licenses/>;.
>   */
> =20
> +#define _GNU_SOURCE
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <unistd.h>
> @@ -117,13 +118,13 @@ read_dasd_pt(int fd, __attribute__((unused))
> struct slice all,
> =20
>  =09=09sprintf(pathname, "/dev/.kpartx-node-%u-%u",
>  =09=09=09(unsigned int)major(dev), (unsigned
> int)minor(dev));
> -=09=09if ((fd_dasd =3D open(pathname, O_RDONLY)) =3D=3D -1) {
> +=09=09if ((fd_dasd =3D open(pathname, O_RDONLY | O_DIRECT)) =3D=3D
> -1) {
>  =09=09=09/* Devicenode does not exist. Try to create one
> */
>  =09=09=09if (mknod(pathname, 0600 | S_IFBLK, dev) =3D=3D -1)
> {
>  =09=09=09=09/* Couldn't create a device node */
>  =09=09=09=09return -1;
>  =09=09=09}
> -=09=09=09fd_dasd =3D open(pathname, O_RDONLY);
> +=09=09=09fd_dasd =3D open(pathname, O_RDONLY | O_DIRECT);
>  =09=09=09/*
>  =09=09=09 * The file will vanish when the last process
> (we)
>  =09=09=09 * has ceased to access it.
> @@ -175,7 +176,7 @@ read_dasd_pt(int fd, __attribute__((unused))
> struct slice all,
>  =09 * Get volume label, extract name and type.
>  =09 */
> =20
> -=09if (!(data =3D (unsigned char *)malloc(blocksize)))
> +=09if (aligned_malloc((void **)&data, blocksize, NULL))
>  =09=09goto out;
> =20
> =20
> diff --git a/kpartx/gpt.c b/kpartx/gpt.c
> index 785b34ea..f7fefb70 100644
> --- a/kpartx/gpt.c
> +++ b/kpartx/gpt.c
> @@ -243,8 +243,7 @@ alloc_read_gpt_entries(int fd, gpt_header * gpt)
> =20
>  =09if (!count) return NULL;
> =20
> -=09pte =3D (gpt_entry *)malloc(count);
> -=09if (!pte)
> +=09if (aligned_malloc((void **)&pte, get_sector_size(fd), &count))
>  =09=09return NULL;
>  =09memset(pte, 0, count);
> =20
> @@ -269,12 +268,11 @@ static gpt_header *
>  alloc_read_gpt_header(int fd, uint64_t lba)
>  {
>  =09gpt_header *gpt;
> -=09gpt =3D (gpt_header *)
> -=09    malloc(sizeof (gpt_header));
> -=09if (!gpt)
> +=09size_t size =3D sizeof (gpt_header);
> +=09if (aligned_malloc((void **)&gpt, get_sector_size(fd), &size))
>  =09=09return NULL;
> -=09memset(gpt, 0, sizeof (*gpt));
> -=09if (!read_lba(fd, lba, gpt, sizeof (gpt_header))) {
> +=09memset(gpt, 0, size);
> +=09if (!read_lba(fd, lba, gpt, size)) {
>  =09=09free(gpt);
>  =09=09return NULL;
>  =09}
> @@ -498,6 +496,7 @@ find_valid_gpt(int fd, gpt_header ** gpt,
> gpt_entry ** ptes)
>  =09gpt_header *pgpt =3D NULL, *agpt =3D NULL;
>  =09gpt_entry *pptes =3D NULL, *aptes =3D NULL;
>  =09legacy_mbr *legacymbr =3D NULL;
> +=09size_t size =3D sizeof(legacy_mbr);
>  =09uint64_t lastlba;
>  =09if (!gpt || !ptes)
>  =09=09return 0;
> @@ -526,11 +525,10 @@ find_valid_gpt(int fd, gpt_header ** gpt,
> gpt_entry ** ptes)
>  =09}
> =20
>  =09/* This will be added to the EFI Spec. per Intel after v1.02.
> */
> -=09legacymbr =3D malloc(sizeof (*legacymbr));
> -=09if (legacymbr) {
> -=09=09memset(legacymbr, 0, sizeof (*legacymbr));
> -=09=09read_lba(fd, 0, (uint8_t *) legacymbr,
> -=09=09=09 sizeof (*legacymbr));
> +=09if (aligned_malloc((void **)&legacymbr, get_sector_size(fd),
> +=09=09=09   &size) =3D=3D 0) {
> +=09=09memset(legacymbr, 0, size);
> +=09=09read_lba(fd, 0, (uint8_t *) legacymbr, size);
>  =09=09good_pmbr =3D is_pmbr_valid(legacymbr);
>  =09=09free(legacymbr);
>  =09=09legacymbr=3DNULL;
> diff --git a/kpartx/kpartx.c b/kpartx/kpartx.c
> index d3620c5c..4716dd4d 100644
> --- a/kpartx/kpartx.c
> +++ b/kpartx/kpartx.c
> @@ -19,6 +19,7 @@
>   * cva, 2002-10-26
>   */
> =20
> +#define _GNU_SOURCE
>  #include <stdio.h>
>  #include <fcntl.h>
>  #include <errno.h>
> @@ -41,7 +42,6 @@
> =20
>  #define SIZE(a) (sizeof(a)/sizeof((a)[0]))
> =20
> -#define READ_SIZE=091024
>  #define MAXTYPES=0964
>  #define MAXSLICES=09256
>  #define DM_TARGET=09"linear"
> @@ -388,7 +388,7 @@ main(int argc, char **argv){
>  =09=09set_delimiter(mapname, delim);
>  =09}
> =20
> -=09fd =3D open(device, O_RDONLY);
> +=09fd =3D open(device, O_RDONLY | O_DIRECT);
> =20
>  =09if (fd =3D=3D -1) {
>  =09=09perror(device);
> @@ -690,9 +690,9 @@ xmalloc (size_t size) {
>   */
> =20
>  static int
> -sseek(int fd, unsigned int secnr) {
> +sseek(int fd, unsigned int secnr, int secsz) {
>  =09off64_t in, out;
> -=09in =3D ((off64_t) secnr << 9);
> +=09in =3D ((off64_t) secnr * secsz);
>  =09out =3D 1;
> =20
>  =09if ((out =3D lseek64(fd, in, SEEK_SET)) !=3D in)
> @@ -703,6 +703,21 @@ sseek(int fd, unsigned int secnr) {
>  =09return 0;
>  }
> =20
> +int
> +aligned_malloc(void **mem_p, size_t align, size_t *size_p)
> +{
> +=09size_t pgsize =3D getpagesize();

Nit: I'd use a static variable here and call getpagesize() only once.

> +=09size_t size =3D pgsize;
> +=09if (!mem_p || !align || (size_p && !*size_p))
> +=09=09return EINVAL;
> +
> +=09if (size_p)
> +=09=09*size_p =3D size =3D ((*size_p + align - 1) / align) *
> align;

It would be cleaner to set *size_p only after successful return from
posix_memalign().

> +
> +=09return posix_memalign(mem_p, pgsize, size);
> +}




> +
> +/* always in sector size blocks */
>  static
>  struct block {
>  =09unsigned int secnr;
> @@ -710,30 +725,39 @@ struct block {
>  =09struct block *next;
>  } *blockhead;
> =20
> +/* blknr is always in 512 byte blocks */
>  char *
> -getblock (int fd, unsigned int secnr) {
> +getblock (int fd, unsigned int blknr) {
> +=09unsigned int secsz =3D get_sector_size(fd);
> +=09unsigned int blks_per_sec =3D secsz / 512;
> +=09unsigned int secnr =3D blknr / blks_per_sec;
> +=09unsigned int blk_off =3D (blknr % blks_per_sec) * 512;
>  =09struct block *bp;
> =20
>  =09for (bp =3D blockhead; bp; bp =3D bp->next)
> =20
>  =09=09if (bp->secnr =3D=3D secnr)
> -=09=09=09return bp->block;
> +=09=09=09return bp->block + blk_off;
> =20
> -=09if (sseek(fd, secnr))
> +=09if (sseek(fd, secnr, secsz))
>  =09=09return NULL;
> =20
>  =09bp =3D xmalloc(sizeof(struct block));
>  =09bp->secnr =3D secnr;
>  =09bp->next =3D blockhead;
>  =09blockhead =3D bp;
> -=09bp->block =3D (char *) xmalloc(READ_SIZE);
> +=09if (aligned_malloc((void **)&bp->block, secsz, NULL)) {
> +=09=09fprintf(stderr, "aligned_malloc failed\n");
> +=09=09exit(1);
> +=09}
> =20
> -=09if (read(fd, bp->block, READ_SIZE) !=3D READ_SIZE) {
> +=09if (read(fd, bp->block, secsz) !=3D secsz) {
>  =09=09fprintf(stderr, "read error, sector %d\n", secnr);
> -=09=09bp->block =3D NULL;
> +=09=09blockhead =3D bp->next;
> +=09=09return NULL;
>  =09}
> =20
> -=09return bp->block;
> +=09return bp->block + blk_off;
>  }
> =20
>  int
> diff --git a/kpartx/kpartx.h b/kpartx/kpartx.h
> index 67edeb82..727632c1 100644
> --- a/kpartx/kpartx.h
> +++ b/kpartx/kpartx.h
> @@ -1,6 +1,7 @@
>  #ifndef _KPARTX_H
>  #define _KPARTX_H
> =20
> +#include <stddef.h>
>  #include <stdint.h>
>  #include <sys/ioctl.h>
> =20
> @@ -61,6 +62,7 @@ extern ptreader read_mac_pt;
>  extern ptreader read_sun_pt;
>  extern ptreader read_ps3_pt;
> =20
> +int aligned_malloc(void **mem_p, size_t align, size_t *size_p);
>  char *getblock(int fd, unsigned int secnr);
> =20
>  static inline unsigned int

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

