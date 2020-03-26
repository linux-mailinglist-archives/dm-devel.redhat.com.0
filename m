Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id BF2AE196F73
	for <lists+dm-devel@lfdr.de>; Sun, 29 Mar 2020 20:52:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585507937;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=CdizgLbh3OklLC+9DGZJTzPFnDW0LWwyB87HkGYph/c=;
	b=JNaK6/BdFpgz+knMGgAzoj9lB4ngHlT/IMZdCmVyQ1TZg0Bi55EBisCUHv1EB4gnaf7Nof
	lK2kc/sCcliHJcG8EcthDJathD73C4GwEYKer2ejYmuiIdr71Q3yJyUOuZ2VOM+c8LLvQs
	DmveciVK/615+DvH9sLJd65xNNhrU9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-ZPfrzoD3N3qgVdx6KdAcDw-1; Sun, 29 Mar 2020 14:52:14 -0400
X-MC-Unique: ZPfrzoD3N3qgVdx6KdAcDw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EB3613F8;
	Sun, 29 Mar 2020 18:52:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6497997AF5;
	Sun, 29 Mar 2020 18:52:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 63A7A944A8;
	Sun, 29 Mar 2020 18:51:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02QGmLTU000959 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 26 Mar 2020 12:48:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EFEC4115158; Thu, 26 Mar 2020 16:48:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB1A09D42
	for <dm-devel@redhat.com>; Thu, 26 Mar 2020 16:48:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEB0E80028B
	for <dm-devel@redhat.com>; Thu, 26 Mar 2020 16:48:18 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-492-_RVBkg-tNvml5TAM7qX6ZQ-1; Thu, 26 Mar 2020 12:48:14 -0400
X-MC-Unique: _RVBkg-tNvml5TAM7qX6ZQ-1
IronPort-SDR: Ecr4vatMTX3HQAYWq++FwieZxHCU++iU0kbTdEXStf0ql3yAvW8qRDrhPJOzmo05/jNuBYo0Jo
	KzXr5HIcMuza63MWLdzkULroQqmJrA34o4b0hrpewbqtsTjWsLq1MV/qHHeGSVE49MvFria/u2
	mQRYX+UE6BXoDRKtjYdKcbIZBoGTejB7HuRZRSm5BeQlzd42vSoThrzcJhVGkisqsjMwpxMtas
	qoHH3xQBR32Xbwvp3flh5df3D7fQKsU9gtl3f4rrNMw6fzD+4AqcR1UyceO4bBHl2gykEL7eRj
	3ZY=
X-IronPort-AV: E=Sophos;i="5.72,309,1580745600"; d="scan'208";a="134027778"
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
	NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
	by ob1.hgst.iphmx.com with ESMTP; 27 Mar 2020 00:48:10 +0800
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
	by BYAPR04MB5573.namprd04.prod.outlook.com (2603:10b6:a03:e2::32)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20;
	Thu, 26 Mar 2020 16:48:08 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
	([fe80::d826:82b2:764f:9733]) by
	BYAPR04MB4965.namprd04.prod.outlook.com
	([fe80::d826:82b2:764f:9733%7]) with mapi id 15.20.2835.023;
	Thu, 26 Mar 2020 16:48:08 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: "hch@infradead.org" <hch@infradead.org>, "Martin K. Petersen"
	<martin.petersen@oracle.com>
Thread-Topic: [PATCH v7 0/6] block: Introduce REQ_ALLOCATE flag for
	REQ_OP_WRITE_ZEROES
Thread-Index: AQHV4kDQBBKrum0yDUCw7xwsJ2OWDw==
Date: Thu, 26 Mar 2020 16:48:08 +0000
Message-ID: <BYAPR04MB4965C03A4E397333E5141B9086CF0@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <e2b7cbab-d91f-fd7b-de6f-a671caa6f5eb@virtuozzo.com>
	<69c0b8a4-656f-98c4-eb55-2fd1184f5fc9@virtuozzo.com>
	<67d63190-c16f-cd26-6b67-641c8943dc3d@virtuozzo.com>
	<20200319102819.GA26418@infradead.org> <yq1tv2k8pjn.fsf@oracle.com>
	<20200325162656.GJ29351@magnolia>
	<20200325163223.GA27156@infradead.org>
	<yq1d090jqlm.fsf@oracle.com> <20200326092935.GA6478@infradead.org>
	<yq1lfnngp6l.fsf@oracle.com> <20200326144556.GA4317@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9a1498e3-a818-441d-0617-08d7d1a57688
x-ms-traffictypediagnostic: BYAPR04MB5573:
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB55738CEC7CC96FF34308486A86CF0@BYAPR04MB5573.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(53546011)(8676002)(110136005)(5660300002)(6506007)(55016002)(52536014)(9686003)(33656002)(2906002)(81156014)(7696005)(316002)(186003)(71200400001)(478600001)(81166006)(86362001)(26005)(76116006)(64756008)(66446008)(54906003)(7416002)(66946007)(66476007)(66556008)(8936002)(4326008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5573;
	H:BYAPR04MB4965.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hCTPhFoW+QtCCKjbdWlLzyIFUfmDlQoDlS2SMZAoxBAsXYYSJFy/wkAYNWndRQ/gZSZs3LJ5fx7Gp+cyIvZYtbS+4KMgk2uxXGToZRtqORynCYKYHbMJ7+0iivvqMEDPkShJMC6uM8KEFHLY13wGbw3azMA2OQ4Jiao2zvlDSIPmY/aiQVUB1jxiSI4P+QwA3oFxImlzSQh6HdKALAqCeoAZDFolRqt/alEWuuTx2jBfTmSgJC4l84zi02iCqPJa28OQnASzK3tNm9ABvV0pt73CC8aBzHvz1cS6krI9Cc0gfJNV7ilsCCF0nJwGUNG4fj5bGZWTEimyg2MkUUdIy7N4m3BXHI0I/pfx+QWyeRgbwQz1R6ivEWKk86BqF6dyqsQExhkAOpddMALVszfMIlZnVdTPTiSeWB+dIpk++yQUA2bj+JZUAV81ZR6DuwTo
x-ms-exchange-antispam-messagedata: KVES1B2XWpvXJn/wU0WHWUDgKv9z0TaRYeVb66a0++nh+iZQ7kAntrXQQCUVF/BS7T5tHQbu93X0rA5wwu8hM1lp4hi4s1ZrbS/nePzwPMWQiyrr3+vV4SZ/QtpWr0sA52uZn0RG+QKIuvnbTNBomw==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1498e3-a818-441d-0617-08d7d1a57688
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 16:48:08.1951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2SaPhnbvAFoZ223+FxntTsi5J6CAzOwkIwl02Bqp+uxsz9u+Fbo2GVSEpqniPqn79aFSczTOp1lkmNmxnOqBYQTbHnWnWHAEA2HNrQV4PiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5573
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02QGmLTU000959
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Sun, 29 Mar 2020 14:51:25 -0400
Cc: "andrea.parri@amarulasolutions.com" <andrea.parri@amarulasolutions.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	"dhowells@redhat.com" <dhowells@redhat.com>,
	"song@kernel.org" <song@kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
	"osandov@fb.com" <osandov@fb.com>, "agk@redhat.com" <agk@redhat.com>,
	"hare@suse.com" <hare@suse.com>, "sagi@grimberg.me" <sagi@grimberg.me>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	"bob.liu@oracle.com" <bob.liu@oracle.com>,
	"minwoo.im.dev@gmail.com" <minwoo.im.dev@gmail.com>,
	"jthumshirn@suse.de" <jthumshirn@suse.de>, Ajay Joshi <Ajay.Joshi@wdc.com>,
	"ming.lei@redhat.com" <ming.lei@redhat.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Kirill Tkhai <ktkhai@virtuozzo.com>, "dsterba@suse.com" <dsterba@suse.com>,
	"bvanassche@acm.org" <bvanassche@acm.org>,
	"axboe@kernel.dk" <axboe@kernel.dk>,
	Damien Le Moal <Damien.LeMoal@wdc.com>, "tytso@mit.edu" <tytso@mit.edu>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tj@kernel.org" <tj@kernel.org>,
	"asml.silence@gmail.com" <asml.silence@gmail.com>
Subject: Re: [dm-devel] [PATCH v7 0/6] block: Introduce REQ_ALLOCATE flag
 for REQ_OP_WRITE_ZEROES
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 03/26/2020 07:46 AM, Christoph Hellwig wrote:
> On Thu, Mar 26, 2020 at 10:34:42AM -0400, Martin K. Petersen wrote:
>>> I just worry about the proliferation of identical merging and
>>> splitting code throughout the block stack as we add additional
>>> single-range, no payload operations (Verify, etc.). I prefer to
>>> enforce the semantics in the LLD and not in the plumbing. But I
>>> won't object to a separate REQ_OP_ALLOCATE if you find the
>>> resulting code duplication acceptable.
> I find it acceptable for now.  And I think we should find some way
> (e.g. by being table driven) to share code between differnet
> opcodes.
>

With reference to Martin's comment (verify etc) there is a significant
advantage when using payloadless bio to offload the functionality
to the directly attached device and over the fabrics when dealing
with larger disks.

How about we create a helper which is independent of the operations
can accept req_op and issues the payloadless bios. Something like
following totally untested :-

diff --git a/block/blk-lib.c b/block/blk-lib.c
index cf9e75a730b4..d3fccd3211cc 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -209,6 +209,33 @@ int blkdev_issue_write_same(struct block_device
*bdev, sector_t sector,
  }
  EXPORT_SYMBOL(blkdev_issue_write_same);

+static void __blkdev_issue_payloadless(struct block_device *bdev,
unsigned op,
+               sector_t sector, sector_t nr_sects, gfp_t gfp_mask,
+               struct bio **biop, unsigned bio_opf, unsigned int
max_sectors)
+{
+       struct bio *bio = *biop;
+
+       while (nr_sects) {
+               bio = blk_next_bio(bio, 0, gfp_mask);
+               bio->bi_iter.bi_sector = sector;
+               bio_set_dev(bio, bdev);
+               bio->bi_opf = op;
+               bio->bi_opf |= bio_opf;
+
+               if (nr_sects > max_sectors) {
+                       bio->bi_iter.bi_size = max_sectors << 9;
+                       nr_sects -= max_sectors;
+                       sector += max_sectors;
+               } else {
+                       bio->bi_iter.bi_size = nr_sects << 9;
+                       nr_sects = 0;
+               }
+               cond_resched();
+       }
+
+       *biop = bio;
+}
+
  static int __blkdev_issue_write_zeroes(struct block_device *bdev,
                 sector_t sector, sector_t nr_sects, gfp_t gfp_mask,
                 struct bio **biop, unsigned flags)
@@ -216,6 +243,7 @@ static int __blkdev_issue_write_zeroes(struct
block_device *bdev,
         struct bio *bio = *biop;
         unsigned int max_write_zeroes_sectors;
         struct request_queue *q = bdev_get_queue(bdev);
+       unsigned int unmap = (flags & BLKDEV_ZERO_NOUNMAP) ? REQ_NOUNMAP
: 0;

         if (!q)
                 return -ENXIO;
@@ -229,24 +257,8 @@ static int __blkdev_issue_write_zeroes(struct
block_device *bdev,
         if (max_write_zeroes_sectors == 0)
                 return -EOPNOTSUPP;

-       while (nr_sects) {
-               bio = blk_next_bio(bio, 0, gfp_mask);
-               bio->bi_iter.bi_sector = sector;
-               bio_set_dev(bio, bdev);
-               bio->bi_opf = REQ_OP_WRITE_ZEROES;
-               if (flags & BLKDEV_ZERO_NOUNMAP)
-                       bio->bi_opf |= REQ_NOUNMAP;
-
-               if (nr_sects > max_write_zeroes_sectors) {
-                       bio->bi_iter.bi_size = max_write_zeroes_sectors
<< 9;
-                       nr_sects -= max_write_zeroes_sectors;
-                       sector += max_write_zeroes_sectors;
-               } else {
-                       bio->bi_iter.bi_size = nr_sects << 9;
-                       nr_sects = 0;
-               }
-               cond_resched();
-       }
+       __blkdev_issue_payloadless(bdev, REQ_OP_WRITE_ZEROES, sector,
nr_sects,
+                       gfp_mask, biop, unmap, max_write_zeroes_sectors);

         *biop = bio;
         return 0;

I'll be happy to send out a well tested patch based on the above
suggestion or any feedback I get and re-spin this series or OP can
re-spin this series whatever works.



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

