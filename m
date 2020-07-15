Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF40220899
	for <lists+dm-devel@lfdr.de>; Wed, 15 Jul 2020 11:22:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-8s37gL9zOhm6n9gvlkWYyQ-1; Wed, 15 Jul 2020 05:22:39 -0400
X-MC-Unique: 8s37gL9zOhm6n9gvlkWYyQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C345D18C63C1;
	Wed, 15 Jul 2020 09:22:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 381EC2DE6B;
	Wed, 15 Jul 2020 09:22:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A185F180954D;
	Wed, 15 Jul 2020 09:22:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06F9MBTq004390 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jul 2020 05:22:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EDE942166B27; Wed, 15 Jul 2020 09:22:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E85FF2157F25
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 09:22:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B62F856A57
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 09:22:08 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-472-ToayD22KNnm9Pd-fPxNjNw-1; Wed, 15 Jul 2020 05:22:06 -0400
X-MC-Unique: ToayD22KNnm9Pd-fPxNjNw-1
IronPort-SDR: fc6Y629bAHqtTO3lRtDrMb+knddsAb4ApyWLKWKTZBAJI+b+MgI4ytHXVm+7oMeCpan46gtTEW
	0QX2KSBXMPek2aAR362ZQw+SvrDfp8XNF1jBh2Af658DA5FgZOr9yJnsbDuMF8Np6HLe9fvN/B
	HxsrZ+0n2MKb0CizPf04ViuAnABqZeIoAVGxcPNpneSr/GGlZpOzxmLCqqs1OE/w5bpUPeBv5e
	erUB/5eAfkeTJuMoiFKaZZDph3Hr0h+EmYe709RSMU840lHAf5iF5x0Ki4aLKzO09MU2PNswpk
	lLU=
X-IronPort-AV: E=Sophos;i="5.75,354,1589212800"; d="scan'208";a="143807210"
Received: from mail-bn3nam04lp2053.outbound.protection.outlook.com (HELO
	NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.53])
	by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2020 17:21:02 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB1049.namprd04.prod.outlook.com (2603:10b6:910:56::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.25;
	Wed, 15 Jul 2020 09:21:00 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::d9e5:135e:cfd9:4de0]) by
	CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::d9e5:135e:cfd9:4de0%7]) with mapi id 15.20.3174.022;
	Wed, 15 Jul 2020 09:21:00 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "snitzer@redhat.com" <snitzer@redhat.com>, "hare@suse.de" <hare@suse.de>
Thread-Topic: [PATCH] dm zoned: update atime for new buffer zones
Thread-Index: AQHWWoB0zV9QyKKjmU6nsllVeV1Qp6kIWkMAgAADOwA=
Date: Wed, 15 Jul 2020 09:20:59 +0000
Message-ID: <52331d4f09d161dad64b85cad26ef620c04196de.camel@wdc.com>
References: <20200715081752.28130-1-hare@suse.de>
	<CY4PR04MB37511C00F22BDC73456FC252E77E0@CY4PR04MB3751.namprd04.prod.outlook.com>
	<a2aac870-d8a1-ab95-0c6e-b4e474f62ae9@suse.de>
In-Reply-To: <a2aac870-d8a1-ab95-0c6e-b4e474f62ae9@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 (3.36.3-1.fc32)
x-originating-ip: [2400:2411:43c0:6000:62d1:16e6:ecb1:d604]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 93bd3b76-698a-46f8-dbc5-08d828a0636e
x-ms-traffictypediagnostic: CY4PR04MB1049:
x-microsoft-antispam-prvs: <CY4PR04MB10492F12C426BC3E8BE6238DE77E0@CY4PR04MB1049.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RZHP3eoqy7t37tm7qN5tMURoIXy+09IamnB/sSR1tXuHLOkQCcXRUpqaautUerpeSEUcgXfZ9x05r1cnThZ9xLJQjUPpV3zIy5TcwVUkaxk1cRoTAmsn1QS2xhzvo0JYYGgnlc6ktPT/AEqtIY/V3suuID4n+JkeY7jzUm8gG7pYL6EnBYuBXFDXcfNzCSPtI27hTpOvZvIELFGQwGur9anQcVTPcl/5J/tI7AwUCSgMFxLc8g6A+0xC5wRGOtmwk9y9KoV1Swy+K7pYxvrvxV58osVRHaIDDY4+pCSP1HhLGpBEttOZJg2hFcISh8WBHpPmUOjU4j/qRSWy3R0jGg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(6506007)(83380400001)(53546011)(186003)(4326008)(15650500001)(6486002)(110136005)(8936002)(8676002)(71200400001)(5660300002)(478600001)(76116006)(66476007)(64756008)(66446008)(66556008)(66946007)(91956017)(6512007)(316002)(86362001)(36756003)(2616005)(2906002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: 90w/0ud0VLR18GSUennEjWA3/WjQIEWaDDrIZck8bY7ro2vZ6w3jIIlozRiGaf/2rxX/GMDZKeSAXN+H5admmO9Xjt8kBdvgz9bTSpVvY4F1vfYDrC4qKm04mzP/vbJkKSmgwiqQsiufN30j3GUgVOZlNr/OOdsr3fLG4ZP1ERmruoRrjte+OS392ffr7FVPit2cElgEc0jTa169V5rJ3+3x0RyJDvLzSJnradBFhE7RNsOHiP2gQuTNN0+wrbs91c867wH5MXv9Ftpz3/Vot/OBNtzaeNukmtt/5c2eErH3EeS+uompdEkMWKv39NZZuzakfQVVFDP3KPCT4WP65lnP3DmX8hwPEAVagAQ/i7Ibo+4DLO2HyaUC5JuYPN6a/DtJ9Fm9nuv6nz6fEhDWYKs8OJ6RIUgTwgaPxW9bXgYKcKOofxjNor6kROVfnUNwgY7Jf/caAAY7z1WdGLhIiNfrW6d8o2MOk0WDaHWX2UaN/jW1fi+qyMfKfTMlsHCaig/rEqnpbBA/Sx+au+UFI5NqXBgQBvz3Ztanq5pD/o8yRt3lXbptmj+o9hmZtq3+
x-ms-exchange-transport-forked: True
Content-ID: <13AE1C8067F3064DBDCBF1288AF8B5FB@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93bd3b76-698a-46f8-dbc5-08d828a0636e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2020 09:21:00.0013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yR4sXVnGNtfZfDEFWy+bmYYFzbSg+W8lBz8er/tw3PCHqjG1hTn7qd6nu/qMQU2g1yVMjvvw4nU+rZylAZ+dFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1049
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06F9MBTq004390
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm zoned: update atime for new buffer zones
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-15 at 11:09 +0200, Hannes Reinecke wrote:
> On 7/15/20 10:49 AM, Damien Le Moal wrote:
> > On 2020/07/15 17:18, Hannes Reinecke wrote:
> > > When a new buffer zone is allocated in dmz_handle_buffered_write()
> > > we should update the 'atime' to inform reclaim that this zone has
> > > been accessed.
> > > Otherwise we end up with the pathological case where the first write
> > > allocates a new buffer zone, but the next write will start reclaim
> > > before processing the bio. As the atime is not set reclaim declares
> > > the system idle and reclaims the zone. Then the write will be processed
> > > and re-allocate the very same zone again; this repeats for every
> > > consecutive write, making for a _very_ slow mkfs.
> > > 
> > > Signed-off-by: Hannes Reinecke <hare@suse.de>
> > > ---
> > >  drivers/md/dm-zoned-target.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> > > index cf915009c306..b32d37bef14f 100644
> > > --- a/drivers/md/dm-zoned-target.c
> > > +++ b/drivers/md/dm-zoned-target.c
> > > @@ -297,6 +297,9 @@ static int dmz_handle_buffered_write(struct dmz_target *dmz,
> > >  	if (dmz_is_readonly(bzone))
> > >  		return -EROFS;
> > >  
> > > +	/* Tell reclaim we're doing some work here */
> > > +	dmz_reclaim_bio_acc(bzone->dev->reclaim);
> > > +
> > >  	/* Submit write */
> > >  	ret = dmz_submit_bio(dmz, bzone, bio, chunk_block, nr_blocks);
> > >  	if (ret)
> > 
> > This is without a cache device, right ? Otherwise, since the cache device has no
> > reclaim, it would not make much sense.
> > 
> > In fact, I think that the atime timestamp being attached to each device reclaim
> > structure is a problem. We do not need that since we always trigger reclaim for
> > all drives. We only want to see if the target is busy or not, so atime should be
> > attached to struct dmz_metadata.
> > 
> > That will simplify things since we will not need to care about which zone/which
> > device is being accessed to track activity. We can just have:
> > 
> > 	dmz_reclaim_bio_acc(dmz->metadata);
> > 
> > Thoughts ?
> > 
> Well, I might be off the mark with this patch, but I did run into the
> the mentioned pathological behaviour; there was exactly _one_ zone
> cached, all I/O was going into that zone, and reclaim (seemed) to be
> busy with that very zone.
> The latter is actually conjecture, as I did _not_ get any messages from
> the reclaim on that device.
> I've seen idle messages from reclaim on the other devices, but reclaim
> from one device was suspiciously silent.
> And I/O went through, but _dead_ slow. All writes, mind (that was during
> mkfs time), so I gathered it might be due to the atime accounting not
> being done correctly.

What is your drive configuration and FS on the target ?

What about this:

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-
metadata.c
index b298fefb022e..4196ec5469bf 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -202,6 +202,9 @@ struct dmz_metadata {
        struct list_head        reserved_seq_zones_list;
 
        wait_queue_head_t       free_wq;
+
+       /* Last target access time */
+       unsigned long           atime;
 };
 
 #define dmz_zmd_info(zmd, format, args...)     \
@@ -354,6 +357,19 @@ bool dmz_dev_is_dying(struct dmz_metadata *zmd)
        return false;
 }
 
+/*
+* For BIO accounting to track the target idle time.
+*/
+void dmz_bio_acc(struct dmz_metadata *zmd)
+{
+       zmd->atime = jiffies;
+}
+
+unsigned long dmz_atime(struct dmz_metadata *zmd)
+{
+       return zmd->atime;
+}
+
 /*
  * Lock/unlock mapping table.
  * The map lock also protects all the zone lists.
@@ -2888,6 +2904,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int
num_dev,
        strcpy(zmd->devname, devname);
        zmd->dev = dev;
        zmd->nr_devs = num_dev;
+       zmd->atime = jiffies;
        zmd->mblk_rbtree = RB_ROOT;
        init_rwsem(&zmd->mblk_sem);
        mutex_init(&zmd->mblk_flush_lock);
diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-
reclaim.c
index 9c0ecc9568a4..f70281a1ea8b 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -24,9 +24,6 @@ struct dmz_reclaim {
        int                     dev_idx;
 
        unsigned long           flags;
-
-       /* Last target access time */
-       unsigned long           atime;
 };
 
 /*
@@ -355,7 +352,7 @@ static void dmz_reclaim_empty(struct dmz_reclaim
*zrc, struct dm_zone *dzone)
  */
 static inline int dmz_target_idle(struct dmz_reclaim *zrc)
 {
-       return time_is_before_jiffies(zrc->atime + DMZ_IDLE_PERIOD);
+       return time_is_before_jiffies(dmz_atime(zrc->metadata) +
DMZ_IDLE_PERIOD);
 }
 
 /*
@@ -561,7 +558,6 @@ int dmz_ctr_reclaim(struct dmz_metadata *zmd,
                return -ENOMEM;
 
        zrc->metadata = zmd;
-       zrc->atime = jiffies;
        zrc->dev_idx = idx;
 
        /* Reclaim kcopyd client */
@@ -620,14 +616,6 @@ void dmz_resume_reclaim(struct dmz_reclaim *zrc)
        queue_delayed_work(zrc->wq, &zrc->work, DMZ_IDLE_PERIOD);
 }
 
-/*
- * BIO accounting.
- */
-void dmz_reclaim_bio_acc(struct dmz_reclaim *zrc)
-{
-       zrc->atime = jiffies;
-}
-
 /*
  * Start reclaim if necessary.
  */
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-
target.c
index 42aa5139df7c..d4785bc8341b 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -404,6 +404,9 @@ static void dmz_handle_bio(struct dmz_target *dmz,
struct dm_chunk_work *cw,
 
        dmz_lock_metadata(zmd);
 
+       /* For reclaim, to track idle time */
+       dmz_bio_acc(zmd);
+
        /*
         * Get the data zone mapping the chunk. There may be no
         * mapping for read and discard. If a mapping is obtained,
@@ -420,7 +423,6 @@ static void dmz_handle_bio(struct dmz_target *dmz,
struct dm_chunk_work *cw,
        if (zone) {
                dmz_activate_zone(zone);
                bioctx->zone = zone;
-               dmz_reclaim_bio_acc(zone->dev->reclaim);
        }
 
        switch (bio_op(bio)) {
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index 22f11440b423..30eaeb2ac9df 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -211,6 +211,9 @@ unsigned int dmz_nr_chunks(struct dmz_metadata
*zmd);
 bool dmz_check_dev(struct dmz_metadata *zmd);
 bool dmz_dev_is_dying(struct dmz_metadata *zmd);
 
+void dmz_bio_acc(struct dmz_metadata *zmd);
+unsigned long dmz_atime(struct dmz_metadata *zmd);
+
 #define DMZ_ALLOC_RND          0x01
 #define DMZ_ALLOC_CACHE                0x02
 #define DMZ_ALLOC_SEQ          0x04
@@ -274,7 +277,6 @@ int dmz_ctr_reclaim(struct dmz_metadata *zmd,
struct dmz_reclaim **zrc, int idx)
 void dmz_dtr_reclaim(struct dmz_reclaim *zrc);
 void dmz_suspend_reclaim(struct dmz_reclaim *zrc);
 void dmz_resume_reclaim(struct dmz_reclaim *zrc);
-void dmz_reclaim_bio_acc(struct dmz_reclaim *zrc);
 void dmz_schedule_reclaim(struct dmz_reclaim *zrc);
 
 /*
@@ -289,7 +291,7 @@ bool dmz_check_bdev(struct dmz_dev *dmz_dev);
  */
 static inline void dmz_deactivate_zone(struct dm_zone *zone)
 {
-       dmz_reclaim_bio_acc(zone->dev->reclaim);
+       dmz_bio_acc(zone->dev->metadata);
        atomic_dec(&zone->refcount);
 }

Does that solve the problem ? (completely untested)

> 
> Cheers,
> 
> Hannes

-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

