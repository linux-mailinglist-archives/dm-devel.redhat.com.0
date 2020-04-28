Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4FCA91BBA20
	for <lists+dm-devel@lfdr.de>; Tue, 28 Apr 2020 11:44:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588067054;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Wxa7LNvLHVeNdj/hWctr7nynON3536nyYfj5PYkV7vc=;
	b=UkhQe+o+6CMA2GlIjVqyZJKfFjvo2VrEu3zAPR2bCGfWN6FBRizIlgx4L7eUh+eJkLBPXO
	Gde33przckrpNophBp7lGRPbpIku3VGirzKc/FidUzRyvts+RAO1LsR5QkYJgyvuhBOKp4
	73o1seoHcTRIf81rTh6IaZnAEw89HtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-X_oRcUqGPsqiilmld7TinQ-1; Tue, 28 Apr 2020 05:44:11 -0400
X-MC-Unique: X_oRcUqGPsqiilmld7TinQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0341A46B;
	Tue, 28 Apr 2020 09:44:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BBE55D750;
	Tue, 28 Apr 2020 09:44:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B61B4CAA0;
	Tue, 28 Apr 2020 09:44:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03S9hu69023577 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Apr 2020 05:43:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8D3E72028E91; Tue, 28 Apr 2020 09:43:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 886512026FFE
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 09:43:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA1B880CDAF
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 09:43:53 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-40-nQmOjqdiN9WOJfodFgzcrg-1; Tue, 28 Apr 2020 05:43:51 -0400
X-MC-Unique: nQmOjqdiN9WOJfodFgzcrg-1
IronPort-SDR: 3qfSy/5f8O68Qtzm74olFRfNKB+LaaQPnoaKr6xz1bPlE6iDAZzwBZtU+of0sYuOySYNc1O5cj
	LLa5uBctYk/BscDYazFIx6VGfOgx0HKXobxWVkhWY9dv/SC50Fp3eXKaFPvFmDpRjMGBDzgTKP
	jv1SBAwYMc9pc9QsPaeKrIl2mp6N9uGTnNj+SSkjgodU8viVXJyCCC2HUmj1XyLlFEJHk8+xuu
	wXlH4Bcn38E350dNue4eXmN2TLFJllL9QdK8Tv8ABPTlfAsyKgDOfFI07/SFy4vGtA59ZtBTBJ
	o20=
X-IronPort-AV: E=Sophos;i="5.73,327,1583164800"; d="scan'208";a="245114613"
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
	NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
	by ob1.hgst.iphmx.com with ESMTP; 28 Apr 2020 17:43:49 +0800
Received: from CH2PR04MB6902.namprd04.prod.outlook.com (2603:10b6:610:a3::24)
	by CH2PR04MB6618.namprd04.prod.outlook.com (2603:10b6:610:68::18)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13;
	Tue, 28 Apr 2020 09:43:48 +0000
Received: from CH2PR04MB6902.namprd04.prod.outlook.com
	([fe80::b54c:8c9b:da45:2034]) by
	CH2PR04MB6902.namprd04.prod.outlook.com
	([fe80::b54c:8c9b:da45:2034%5]) with mapi id 15.20.2937.023;
	Tue, 28 Apr 2020 09:43:48 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 09/13] dm-zoned: replace 'target' pointer in the bio
	context
Thread-Index: AQHWFvuwjbK+lb1XQkKF+Wfh1CBqNg==
Date: Tue, 28 Apr 2020 09:43:48 +0000
Message-ID: <CH2PR04MB69025EE2333E2E72F9658F92E7AC0@CH2PR04MB6902.namprd04.prod.outlook.com>
References: <20200420100824.124618-1-hare@suse.de>
	<20200420100824.124618-10-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 895c5526-36b5-45b0-2c83-08d7eb58a70f
x-ms-traffictypediagnostic: CH2PR04MB6618:
x-microsoft-antispam-prvs: <CH2PR04MB6618B13A4162C3CB89AADA0EE7AC0@CH2PR04MB6618.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:126;
x-forefront-prvs: 0387D64A71
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CH2PR04MB6902.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(346002)(366004)(396003)(39860400002)(376002)(136003)(66946007)(4326008)(26005)(55016002)(8676002)(478600001)(316002)(81156014)(86362001)(91956017)(110136005)(9686003)(76116006)(54906003)(66556008)(66476007)(66446008)(64756008)(52536014)(2906002)(8936002)(186003)(33656002)(5660300002)(6506007)(53546011)(71200400001)(7696005);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lp+RLHrd2Dgg54H1wME9H/D3M8aeF6Ijgd2zMzoRJh4JXXcG+ZLG5gAvdd2Ou84/ERuk0vmeP2Z31uzY5pc1VYbgVw4VhrekRXcIYW3P1y1J1/2syJR3Uz7n8u2IPCAipJ9z9Io4I6Wlm5dZQbrswgseVrMHIHlR7TPpD5O2Dn+OlMWJw7LMtDJXSn8eEiz05/ktcrJ+RozzQTVXDPJU6HEWa0eL+2BuQKQp2aClf3DaAeAK08H6vJ/fCdrFzLVSBQwG+q6Ew6WJa+NX5u8lEHpTIK2E0SZA4WOUcF6wEWfE/V1SiaIZQRgwOArZaSZfWJAMzPq5nEvbYruS8KB7PC6F8ONYG2I/xvjDy4y1gLqCATrOcuAVy7AcYzMxFxY+gskCcX4J7LtYeS9q8Kqc3szUFDdZzZSYAjIIDilvIGAvf8APTi2xDOqZ5gRsHZl7
x-ms-exchange-antispam-messagedata: Vn3Tny92/vb/UEPX3WaYEmaHIJhwdBtbTPVkm9YtzL4zR+UlApPVq8v4tlW7R8mjhhQvn2T8V1AnqlXAbeDz9QCpFmcAsLu7Pk8E1DM+/aU2x5BaBwYIlI9xsgc+A9dJq/5/871z62K9MPMfjArSY6TqMv7EHjkuykheED5uQAbv+h45WiI6NImrX3J5ZABJEmJFKkbrGIgEf6iOjuf1oj5Ugdx/7qYoQTqyBKJEgZWlT+Vt/lA/H4L8X4O0oJ1TkXxg9ryrL/4z28G1EVVaGzmo+p77E7EPgXJ01SOBhJMIyNc/fkf5W/z7pGYfkUlbwfN5k8ECzLqcqhc1MxCLg7Z7JEo5dUGsCeEw8BCvSi9R4Ml/JyOvd2bV8hAsBmpNI2nQIBsqt6Pq7ltlj7JEJwtiw+23US1nlGBV66u8+SyjI0Hd8ahkneVXSALWnXA5lUJB05FpxlVszXg7GizxgdYol/hdPpHOrx9T8AnXiRcMkbI+hgvLHB3TRaYcDv6fYDD3LqNFvdnlZjUEQ4kri+9VE32HKXjzwXHzTowYqt4fzBsqMsT4rphCatzb4dJ/Zgb/G42wuA0evj5t3924+1Tr48BJvpn/Nh7LnERqZaBcW7JeH28IMgjQMNs3SY+AGNszEWzpqMMizFxcF2hojELd/4+GL+qYTxIl9lzXEV+IFk0XNcliEJYamYx8csi8DQSwfpg/u9xJWZc0DVvilPstQWtErXNz0A8DfE5UVlFhcnCAaSZh1i31QJd6XuJm6eYfqYT7D2IU1zDg+ZQgb3OojCxhNmOeh0hJStv9ZVs=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 895c5526-36b5-45b0-2c83-08d7eb58a70f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2020 09:43:48.7478 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: urp3y8NDq5y/ZnepCoaENcJzfKo6tfw0f0hrXZe6h4VTHSB+nw//WbYTv95A8GeBnam37TuT7Fv1KLkY/CEhSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6618
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03S9hu69023577
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 09/13] dm-zoned: replace 'target' pointer in
 the bio context
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/04/20 19:08, Hannes Reinecke wrote:
> Replace the 'target' pointer in the bio context with the
> device pointer as this is what's actually used.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Bob Liu <bob.liu@oracle.com>
> ---
>  drivers/md/dm-zoned-target.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index a1f42af2877c..4897ffae96ca 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -17,7 +17,7 @@
>   * Zone BIO context.
>   */
>  struct dmz_bioctx {
> -	struct dmz_target	*target;
> +	struct dmz_dev		*dev;
>  	struct dm_zone		*zone;
>  	struct bio		*bio;
>  	refcount_t		ref;
> @@ -81,7 +81,7 @@ static inline void dmz_bio_endio(struct bio *bio, blk_status_t status)
>  	if (status != BLK_STS_OK && bio->bi_status == BLK_STS_OK)
>  		bio->bi_status = status;
>  	if (bio->bi_status != BLK_STS_OK)
> -		bioctx->target->dev->flags |= DMZ_CHECK_BDEV;
> +		bioctx->dev->flags |= DMZ_CHECK_BDEV;
>  
>  	if (refcount_dec_and_test(&bioctx->ref)) {
>  		struct dm_zone *zone = bioctx->zone;
> @@ -119,13 +119,18 @@ static int dmz_submit_bio(struct dmz_target *dmz, struct dm_zone *zone,
>  			  unsigned int nr_blocks)
>  {
>  	struct dmz_bioctx *bioctx = dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
> +	struct dmz_dev *dev = dmz_zone_to_dev(dmz->metadata, zone);
>  	struct bio *clone;
>  
> +	if (dev->flags & DMZ_BDEV_DYING)
> +		return -EIO;
> +
>  	clone = bio_clone_fast(bio, GFP_NOIO, &dmz->bio_set);
>  	if (!clone)
>  		return -ENOMEM;
>  
> -	bio_set_dev(clone, dmz->dev->bdev);
> +	bio_set_dev(clone, dev->bdev);
> +	bioctx->dev = dev;
>  	clone->bi_iter.bi_sector =
>  		dmz_start_sect(dmz->metadata, zone) + dmz_blk2sect(chunk_block);
>  	clone->bi_iter.bi_size = dmz_blk2sect(nr_blocks) << SECTOR_SHIFT;
> @@ -397,11 +402,6 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
>  
>  	dmz_lock_metadata(zmd);
>  
> -	if (dmz->dev->flags & DMZ_BDEV_DYING) {
> -		ret = -EIO;
> -		goto out;
> -	}
> -
>  	/*
>  	 * Get the data zone mapping the chunk. There may be no
>  	 * mapping for read and discard. If a mapping is obtained,
> @@ -625,7 +625,6 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
>  {
>  	struct dmz_target *dmz = ti->private;
>  	struct dmz_metadata *zmd = dmz->metadata;
> -	struct dmz_dev *dev = dmz->dev;
>  	struct dmz_bioctx *bioctx = dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
>  	sector_t sector = bio->bi_iter.bi_sector;
>  	unsigned int nr_sectors = bio_sectors(bio);
> @@ -642,8 +641,6 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
>  		(unsigned long long)dmz_chunk_block(zmd, dmz_bio_block(bio)),
>  		(unsigned int)dmz_bio_blocks(bio));
>  
> -	bio_set_dev(bio, dev->bdev);
> -
>  	if (!nr_sectors && bio_op(bio) != REQ_OP_WRITE)
>  		return DM_MAPIO_REMAPPED;
>  
> @@ -652,7 +649,7 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
>  		return DM_MAPIO_KILL;
>  
>  	/* Initialize the BIO context */
> -	bioctx->target = dmz;
> +	bioctx->dev = NULL;
>  	bioctx->zone = NULL;
>  	bioctx->bio = bio;
>  	refcount_set(&bioctx->ref, 1);
> @@ -931,11 +928,12 @@ static void dmz_io_hints(struct dm_target *ti, struct queue_limits *limits)
>  static int dmz_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
>  {
>  	struct dmz_target *dmz = ti->private;
> +	struct dmz_dev *dev = &dmz->dev[0];
>  
> -	if (!dmz_check_bdev(dmz->dev))
> +	if (!dmz_check_bdev(dev))
>  		return -EIO;
>  
> -	*bdev = dmz->dev->bdev;
> +	*bdev = dev->bdev;
>  
>  	return 0;
>  }
> 

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

