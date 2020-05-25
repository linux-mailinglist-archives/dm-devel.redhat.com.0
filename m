Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 83E6C1E04A3
	for <lists+dm-devel@lfdr.de>; Mon, 25 May 2020 04:18:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590373085;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=n6tqGbPhPgJ9Hd8MpbhKSwgRbwLkDpAosWAFvSr7fQM=;
	b=Jiq1Xr+dQcDGvovgFfa3rV01QV8HTuZxh5OGvE9kiiFa7u6dEQkddaPRz5RnkakBgSaHVd
	za8NR35+IP+mkjWAs71BqSkPJSjg7+0ZiGvIup3lyPbl+gb0/TyIECjIxJknE1PLwzNFy1
	s/8JSHf06lsNJJ+o0EZTAuV/T7N3zFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-t6ZwxmE8NJqT4kAtSzW6Dw-1; Sun, 24 May 2020 22:18:01 -0400
X-MC-Unique: t6ZwxmE8NJqT4kAtSzW6Dw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C786F8014D7;
	Mon, 25 May 2020 02:17:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 827DA83862;
	Mon, 25 May 2020 02:17:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D471D54D2A;
	Mon, 25 May 2020 02:17:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04P2HpvX032256 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 24 May 2020 22:17:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C5E412156A50; Mon, 25 May 2020 02:17:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E6952156A4C
	for <dm-devel@redhat.com>; Mon, 25 May 2020 02:17:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C41F802641
	for <dm-devel@redhat.com>; Mon, 25 May 2020 02:17:47 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-422-D6dTLQ8NMF6pT4vm2qVQCQ-1; Sun, 24 May 2020 22:17:42 -0400
X-MC-Unique: D6dTLQ8NMF6pT4vm2qVQCQ-1
IronPort-SDR: M84gI7XCpgNrJ05FqMACiSUiiaP39+tXantjao841Q5z/SvjPgRdMEedoYj1w5EnjkdmUId95e
	+PzJijKi+V+G4lCa19pRmPwDCYIQGgGK0VXsIKIE5JPufGrN6G/NLhIzvyJBlqx5ZmLpfWjYVb
	JKi/4/WpR/bifqAMO1vKNOPXTPtOlxtur4A26wMK9EcmjirS8lLQYb/Bew6ZKra1b09bfQqBZc
	Uf6+evBcFQoC+kg/9265iZLBONFvkNV0/0pMIToRGrzgH24wf0QtxUnymFNjAAGHeFabYiP+7E
	vk4=
X-IronPort-AV: E=Sophos;i="5.73,431,1583164800"; d="scan'208";a="247462774"
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
	by ob1.hgst.iphmx.com with ESMTP; 25 May 2020 10:17:40 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0167.namprd04.prod.outlook.com (2603:10b6:903:3b::10)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24;
	Mon, 25 May 2020 02:17:40 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3021.029;
	Mon, 25 May 2020 02:17:40 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>
Thread-Topic: [PATCH 06/12] dm-zoned: add metadata pointer to struct dmz_dev
Thread-Index: AQHWME8nxE5btkpHo02GQC0S5tu29Q==
Date: Mon, 25 May 2020 02:17:40 +0000
Message-ID: <CY4PR04MB375138D29825827BA4DFEDD9E7B30@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200522153901.133375-1-hare@suse.de>
	<20200522153901.133375-7-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 08f6b1df-d7ed-425b-cf62-08d80051ccd5
x-ms-traffictypediagnostic: CY4PR04MB0167:
x-microsoft-antispam-prvs: <CY4PR04MB0167F51D2AF88209941BBB92E7B30@CY4PR04MB0167.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:295;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qXpkd73JEC7t+4830FXA7FURMAYrWusMfuWbrm7qGX8fLslkHzu9PLwVisW3LBQo8FPTdaf+bFzShwQg7PlnQrYPkZsVYV0L639KkeFzhk/kmZgs/mA62EXFqCRuoim+693JXDbVPyYSx7VnOD5Xq/Bm4yAT7a5tE3hjOQdt/rxGMeL5yEeXxg/BDwRWJGza7JgpY2MPdEpuvN9s+lWlwhrnJJeHC3yoVPbO0HqKbX3ClFS4SgXerMeLpRiebnhPHAJsIX765boJnnxlPO2DCdzcVqEtOO7MpvoGt7YMHvVXSJ7pipyKql0InelhUuVnLRPG+mtgyI2NLD+E7WhMuA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(6916009)(76116006)(5660300002)(66446008)(91956017)(66946007)(66556008)(71200400001)(64756008)(66476007)(52536014)(9686003)(55016002)(8676002)(54906003)(478600001)(316002)(6506007)(53546011)(8936002)(186003)(33656002)(4326008)(26005)(2906002)(7696005)(86362001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: rk61UxhrFqw6jARuV7eONzTNTzAjAamujn3IQkH0TegVLnNhlnvxy+RKtr+2ltH2sUawjZb1aL0kJ4Y8gt35m+2iqtPGVInUvEdrV2BVGLuwrDBijh8cKlrEx5RPJRU92BZe+t0vQwuX+KTDbbgOj9XKr93I3rjFqo+t/DhwWeofo5FERdBypRifIIScw9zzma7URcDrdlnXqQgMWZrNzWSTkCsfIMLY2GC0VaEArK0CrBtAQaaGRAE9Y9Wxk8NFXHlc4GdfvwMWUuX6a4rGZmXaZAnwdnn2wwyRpPoc1t1ytMX+XloStZ1lHTNsmjtb0U05XrIZFOmrirw6hBBemfiTAnQoStmeyOqEFctUIzbRmAltH0rlVw/OCM/S+TJPWFJDLWBZdFXNZ9ZAZnwxzo7gCD1Iu3tRistwJfJN75prNmdUdLiqSqjP4Z7a+lgPwIkWzwMrZ2BOO3R7MxDJ19fu+T9z5WLyMD8LOgwixs8=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f6b1df-d7ed-425b-cf62-08d80051ccd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 02:17:40.0980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NjbJVlih2HszXxHc7a/UQs3hv7k5mLhZ506cYN+yzz6WSrGCSlALCSeva3haPc/Gz46vRX7tT0OcsUYx1xzoPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0167
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04P2HpvX032256
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH 06/12] dm-zoned: add metadata pointer to
	struct dmz_dev
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

On 2020/05/23 0:39, Hannes Reinecke wrote:
> Add a metadata pointer to struct dmz_dev and use it as argument
> for blkdev_report_zones() instead of the metadata itself.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 14 +++++++++-----
>  drivers/md/dm-zoned.h          |  7 ++++---
>  2 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 7b6e7404f1e8..73479b4c8bca 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -1343,8 +1343,8 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>   */
>  static int dmz_init_zone(struct blk_zone *blkz, unsigned int num, void *data)
>  {
> -	struct dmz_metadata *zmd = data;
> -	struct dmz_dev *dev = zmd->nr_devs > 1 ? &zmd->dev[1] : &zmd->dev[0];
> +	struct dmz_dev *dev = data;
> +	struct dmz_metadata *zmd = dev->metadata;
>  	int idx = num + dev->zone_offset;
>  	struct dm_zone *zone = kzalloc(sizeof(struct dm_zone), GFP_KERNEL);
>  
> @@ -1480,8 +1480,12 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
>  
>  	/* Allocate zone array */
>  	zmd->nr_zones = 0;
> -	for (i = 0; i < zmd->nr_devs; i++)
> -		zmd->nr_zones += zmd->dev[i].nr_zones;
> +	for (i = 0; i < zmd->nr_devs; i++) {
> +		struct dmz_dev *dev = &zmd->dev[i];
> +
> +		dev->metadata = zmd;
> +		zmd->nr_zones += dev->nr_zones;
> +	}
>  
>  	if (!zmd->nr_zones) {
>  		DMERR("(%s): No zones found", zmd->devname);
> @@ -1516,7 +1520,7 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
>  	 * first randomly writable zone.
>  	 */
>  	ret = blkdev_report_zones(zoned_dev->bdev, 0, BLK_ALL_ZONES,
> -				  dmz_init_zone, zmd);
> +				  dmz_init_zone, zoned_dev);
>  	if (ret < 0) {
>  		DMDEBUG("(%s): Failed to report zones, error %d",
>  			zmd->devname, ret);
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index 356b436425e4..dab701893b67 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -45,11 +45,15 @@
>  #define dmz_bio_block(bio)	dmz_sect2blk((bio)->bi_iter.bi_sector)
>  #define dmz_bio_blocks(bio)	dmz_sect2blk(bio_sectors(bio))
>  
> +struct dmz_metadata;
> +struct dmz_reclaim;
> +
>  /*
>   * Zoned block device information.
>   */
>  struct dmz_dev {
>  	struct block_device	*bdev;
> +	struct dmz_metadata	*metadata;
>  
>  	char			name[BDEVNAME_SIZE];
>  	uuid_t			uuid;
> @@ -168,9 +172,6 @@ enum {
>  #define dmz_dev_debug(dev, format, args...)	\
>  	DMDEBUG("(%s): " format, (dev)->name, ## args)
>  
> -struct dmz_metadata;
> -struct dmz_reclaim;
> -
>  /*
>   * Functions defined in dm-zoned-metadata.c
>   */
> 

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

