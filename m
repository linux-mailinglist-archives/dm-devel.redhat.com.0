Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D18EE1A050A
	for <lists+dm-devel@lfdr.de>; Tue,  7 Apr 2020 04:54:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586228044;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=QSH6Z+SW7s//IwaW+9dror9vl5zsQqVyqPQuhTO8lhU=;
	b=WNYiV5g8HEd3KSXfNKi8l4aKBxDZoKWTUYFGiArOvwxg8M68UK9n3teiQxUvbWo9SM6Ojh
	5Stxn13THGmDi/OhgPIb/j2KyXcdZmQ/iIJfwm9EeLBVK6cpVsnzDFA/SmCyLmQGT+MYUy
	9o/T9aXpHd6WEcGxxiiAQRoarsH1Dhg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-hAyQyMoqMn2AbfEznSyUcQ-1; Mon, 06 Apr 2020 22:54:01 -0400
X-MC-Unique: hAyQyMoqMn2AbfEznSyUcQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C159800D50;
	Tue,  7 Apr 2020 02:53:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F68B1001DC0;
	Tue,  7 Apr 2020 02:53:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6506093A62;
	Tue,  7 Apr 2020 02:53:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0372qwtd002522 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 22:52:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 190042028CD6; Tue,  7 Apr 2020 02:52:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 144562026D69
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 02:52:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0805101A55D
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 02:52:55 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-31-i3alS-GZPFGmpTFWIW6J9A-1; Mon, 06 Apr 2020 22:52:53 -0400
X-MC-Unique: i3alS-GZPFGmpTFWIW6J9A-1
IronPort-SDR: N3jT3Z6Mqo5PaZ0P/Y1u6QyjguiDsJaXxw/yT59hfSGfr3SNo9RrUAWY7VxreZiiLhVzTYymDF
	fpkwLbyiI5Drfp3H/Rns1q1QqMh2VNe95JPpzL6A/sAguvrlWv9qfm1lrAzCtr7Q5mndze1FqS
	ktJch6E4oz5uwg0PYjTHLtzORYR4QyfwnVkVhPjyfgLTBrmI0e2PeXoYx1Zhk1rvpXeMh3v6X8
	c33mjXprNCf/kEjnkK1waNmNUYDwTu0gLKeVBUieiXRdFfccqPtJ/so7Bbx6c8sFAWjtlq+hrR
	r4I=
X-IronPort-AV: E=Sophos;i="5.72,353,1580745600"; d="scan'208";a="243274995"
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
	NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
	by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2020 10:52:51 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB7025.namprd04.prod.outlook.com (2603:10b6:a03:22f::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20;
	Tue, 7 Apr 2020 02:52:50 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::d9cc:93c6:19f5:200c]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::d9cc:93c6:19f5:200c%3]) with mapi id 15.20.2878.018;
	Tue, 7 Apr 2020 02:52:50 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 08/11] dm-zoned: use dmz_zone_to_dev() when handling
	metadata I/O
Thread-Index: AQHWDDiZm/lv1x1Y4kOed2Evlz5NbQ==
Date: Tue, 7 Apr 2020 02:52:50 +0000
Message-ID: <BY5PR04MB6900030603C2AD019DDC04E7E7C30@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200406143505.133271-1-hare@suse.de>
	<20200406143505.133271-9-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cb7765d7-2db8-41e1-0c13-08d7da9ec2b3
x-ms-traffictypediagnostic: BY5PR04MB7025:
x-microsoft-antispam-prvs: <BY5PR04MB702537ECC9E66872765A6D6FE7C30@BY5PR04MB7025.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:534;
x-forefront-prvs: 036614DD9C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(110136005)(54906003)(81156014)(478600001)(53546011)(6506007)(7696005)(8676002)(26005)(316002)(86362001)(2906002)(81166006)(8936002)(33656002)(76116006)(186003)(5660300002)(64756008)(66946007)(66476007)(55016002)(9686003)(4326008)(52536014)(66446008)(66556008)(71200400001);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FXlrxYBPdqvTNm/u8PXPd1GHrERq14TUavp46/bSXIK8cOywDvnGh1sKujHsE0nA1J4Lf9FCXrlpInjUA3zd4mowFx/UPgKjKd71BkKdi+d2WBXv+acG3HtE3BfNvvOqdxkOdb84v7hHQXCGZTjQ7Oa6OVVswxABEr/CQ24lLLx2YrEIoYfd2O83+JEpygJTE8ChUm5qN8xmV8G0D/Hmz0KvT+G90Xg/Gs6KCKSquo4OXSczDBxsBKnbvW/6ml9gGxsq3lBrV32mvL/9QYZ7n0eQlNaoWE7lYC4d4A3gA5pJroODxfGOUmn0OekpwbETmTmmLh0kmWpzTYl3mbUO53i9nfFT6aGjCIr6gbj1woIuhxIDFjeCGq08o2TWt0aaRflD+ulzuBx6yfi6MzdgqMeP+ORo4ZCbYHolc53yHXJhK1XeoZ2UT5Uesu/z1e9q
x-ms-exchange-antispam-messagedata: VgXJtUJ0g4nwML6ghQvtxSjzFXoITzbA8ykKe06EPIz0YaRAyB5NXnrw0EXU6x4vtStqCDLj20d2RuyesSaukZ0qLm9+pLerLFMkMQ9zpRiqtIJB/Ljaf64kg/4V7XlJ+bFskeSTvG0eMrfDbveqlA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb7765d7-2db8-41e1-0c13-08d7da9ec2b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2020 02:52:50.0883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NIh0NT9n/TZB8L6SoUV8eJh0vYEXqvD5uQgXRsSo/KYtOUJ9PMB4xvC7plqZfBlbf4z+Tse4ZB935IME8pVWVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7025
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0372qwtd002522
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 08/11] dm-zoned: use dmz_zone_to_dev() when
 handling metadata I/O
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/04/07 2:27, Hannes Reinecke wrote:
> Use accessors to retrieve the device pointer in preparation
> for adding an additional block device.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>

Looks OK.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

> ---
>  drivers/md/dm-zoned-metadata.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 9919aa6210c1..08707c886ca2 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -1310,6 +1310,7 @@ static int dmz_update_zone_cb(struct blk_zone *blkz, unsigned int idx,
>   */
>  static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  {
> +	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
>  	unsigned int noio_flag;
>  	int ret;
>  
> @@ -1320,16 +1321,16 @@ static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  	 * GFP_NOIO was specified.
>  	 */
>  	noio_flag = memalloc_noio_save();
> -	ret = blkdev_report_zones(zmd->dev->bdev, dmz_start_sect(zmd, zone), 1,
> +	ret = blkdev_report_zones(dev->bdev, dmz_start_sect(zmd, zone), 1,
>  				  dmz_update_zone_cb, zone);
>  	memalloc_noio_restore(noio_flag);
>  
>  	if (ret == 0)
>  		ret = -EIO;
>  	if (ret < 0) {
> -		dmz_dev_err(zmd->dev, "Get zone %u report failed",
> +		dmz_dev_err(dev, "Get zone %u report failed",
>  			    dmz_id(zmd, zone));
> -		dmz_check_bdev(zmd->dev);
> +		dmz_check_bdev(dev);
>  		return ret;
>  	}
>  
> @@ -1343,6 +1344,7 @@ static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  static int dmz_handle_seq_write_err(struct dmz_metadata *zmd,
>  				    struct dm_zone *zone)
>  {
> +	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
>  	unsigned int wp = 0;
>  	int ret;
>  
> @@ -1351,7 +1353,7 @@ static int dmz_handle_seq_write_err(struct dmz_metadata *zmd,
>  	if (ret)
>  		return ret;
>  
> -	dmz_dev_warn(zmd->dev, "Processing zone %u write error (zone wp %u/%u)",
> +	dmz_dev_warn(dev, "Processing zone %u write error (zone wp %u/%u)",
>  		     dmz_id(zmd, zone), zone->wp_block, wp);
>  
>  	if (zone->wp_block < wp) {
> @@ -1384,7 +1386,7 @@ static int dmz_reset_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  		return 0;
>  
>  	if (!dmz_is_empty(zone) || dmz_seq_write_err(zone)) {
> -		struct dmz_dev *dev = zmd->dev;
> +		struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
>  
>  		ret = blkdev_zone_mgmt(dev->bdev, REQ_OP_ZONE_RESET,
>  				       dmz_start_sect(zmd, zone),
> @@ -2098,12 +2100,13 @@ int dmz_merge_valid_blocks(struct dmz_metadata *zmd, struct dm_zone *from_zone,
>  int dmz_validate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
>  			sector_t chunk_block, unsigned int nr_blocks)
>  {
> +	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
>  	unsigned int count, bit, nr_bits;
>  	unsigned int zone_nr_blocks = zmd->zone_nr_blocks;
>  	struct dmz_mblock *mblk;
>  	unsigned int n = 0;
>  
> -	dmz_dev_debug(zmd->dev, "=> VALIDATE zone %u, block %llu, %u blocks",
> +	dmz_dev_debug(dev, "=> VALIDATE zone %u, block %llu, %u blocks",
>  		      dmz_id(zmd, zone), (unsigned long long)chunk_block,
>  		      nr_blocks);
>  
> @@ -2133,7 +2136,7 @@ int dmz_validate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
>  	if (likely(zone->weight + n <= zone_nr_blocks))
>  		zone->weight += n;
>  	else {
> -		dmz_dev_warn(zmd->dev, "Zone %u: weight %u should be <= %u",
> +		dmz_dev_warn(dev, "Zone %u: weight %u should be <= %u",
>  			     dmz_id(zmd, zone), zone->weight,
>  			     zone_nr_blocks - n);
>  		zone->weight = zone_nr_blocks;
> @@ -2179,11 +2182,12 @@ static int dmz_clear_bits(unsigned long *bitmap, int bit, int nr_bits)
>  int dmz_invalidate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
>  			  sector_t chunk_block, unsigned int nr_blocks)
>  {
> +	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
>  	unsigned int count, bit, nr_bits;
>  	struct dmz_mblock *mblk;
>  	unsigned int n = 0;
>  
> -	dmz_dev_debug(zmd->dev, "=> INVALIDATE zone %u, block %llu, %u blocks",
> +	dmz_dev_debug(dev, "=> INVALIDATE zone %u, block %llu, %u blocks",
>  		      dmz_id(zmd, zone), (u64)chunk_block, nr_blocks);
>  
>  	WARN_ON(chunk_block + nr_blocks > zmd->zone_nr_blocks);
> @@ -2213,7 +2217,7 @@ int dmz_invalidate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
>  	if (zone->weight >= n)
>  		zone->weight -= n;
>  	else {
> -		dmz_dev_warn(zmd->dev, "Zone %u: weight %u should be >= %u",
> +		dmz_dev_warn(dev, "Zone %u: weight %u should be >= %u",
>  			     dmz_id(zmd, zone), zone->weight, n);
>  		zone->weight = 0;
>  	}
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

