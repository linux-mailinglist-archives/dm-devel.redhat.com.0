Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DED3D1A04DE
	for <lists+dm-devel@lfdr.de>; Tue,  7 Apr 2020 04:26:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586226395;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=jn0LdUSAFXeqhV+KplQvEhyyzyl6V706bJI2B3qPBNQ=;
	b=A7Z4YxFDDwweD2p7T9jrCHYBPTHJqIfw3uDa3SpckqUTGcYgNzlSapp6NiuYkGHtwW9ecI
	+L0oSTWuzGcONzb7I3gyC3b2NMn1vGr3prTb11ArywTu5HpZNAZvwK1Zf/mNZBKyvNFwAw
	9IooDshealkC+7W4iCCtoheBrH6x76c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-dXtFl95dOX6z4Hh0QIlkjg-1; Mon, 06 Apr 2020 22:26:33 -0400
X-MC-Unique: dXtFl95dOX6z4Hh0QIlkjg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33E578017FC;
	Tue,  7 Apr 2020 02:26:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8A3C60BE2;
	Tue,  7 Apr 2020 02:26:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 813231809567;
	Tue,  7 Apr 2020 02:26:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0372QLoT001007 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 22:26:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EB51A20230A6; Tue,  7 Apr 2020 02:26:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E40222028DCB
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 02:26:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FC53185A78F
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 02:26:18 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-237-FiGYbk5mMaGpo9-vOpRtVg-1; Mon, 06 Apr 2020 22:26:13 -0400
X-MC-Unique: FiGYbk5mMaGpo9-vOpRtVg-1
IronPort-SDR: Bob9QkFweHTaoxLwcu2NIeohDzisrwLSaiNjma5XGEA3oKFY2XbcgchaCgM4dzMs468Dp72Qru
	VV1zqyf3V09oGYRoZxFs+BQp010/W2WOV8dD1K4m718q89OnE6oJDkzq2Aa3uezg25W57a87pM
	YEec9cdBV3kYJBCX2nOflJMf8YWO+wtdCrxwIP8TEiPZLoUhW7TZ/sU3oMyCro/mTi/RAgGnus
	5PvjTXMVomKp8pNfmvFxz0POcOsrG2+FkOMBu4J2JRNTUbIg81x7jomq6eMhpSii8MmCy8XuyC
	XS8=
X-IronPort-AV: E=Sophos;i="5.72,353,1580745600"; d="scan'208";a="136185346"
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
	NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
	by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2020 10:26:11 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6295.namprd04.prod.outlook.com (2603:10b6:a03:1f2::13)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15;
	Tue, 7 Apr 2020 02:26:09 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::d9cc:93c6:19f5:200c]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::d9cc:93c6:19f5:200c%3]) with mapi id 15.20.2878.018;
	Tue, 7 Apr 2020 02:26:08 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 05/11] dm-zoned: introduce dmz_metadata_label() to format
	device name
Thread-Index: AQHWDDjaX7o21rESJkGIGQICs32K+A==
Date: Tue, 7 Apr 2020 02:26:08 +0000
Message-ID: <BY5PR04MB6900F83D0D17A2A183B1513BE7C30@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200406143505.133271-1-hare@suse.de>
	<20200406143505.133271-6-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c478e5ab-e820-4fca-97b0-08d7da9b0843
x-ms-traffictypediagnostic: BY5PR04MB6295:
x-microsoft-antispam-prvs: <BY5PR04MB629569F86FFDD3C23A9F50EEE7C30@BY5PR04MB6295.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:240;
x-forefront-prvs: 036614DD9C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(346002)(136003)(376002)(366004)(396003)(39850400004)(7696005)(316002)(5660300002)(33656002)(66446008)(54906003)(52536014)(64756008)(76116006)(110136005)(8936002)(478600001)(6506007)(66476007)(8676002)(53546011)(81166006)(71200400001)(66556008)(186003)(81156014)(2906002)(55016002)(4326008)(66946007)(26005)(86362001)(9686003);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Eai+KoCeQbVkTtZnveJvz2CrLf7IXHStRNl6tAz+ROMIHBW9ags8X7jOpLOg3l9IrVKcvO4BHdDqz7zKzNq6Boh7TifEP8zZsCNtgDV0sySRlIVe5bisLqYJwDLtltfukwViFCKdz+8+WKBeqMk2F5qyRpnXVaW5vRFR8GxaHrhAEjfSAcyB0ZHsLe72PH6a9NrwodzrECKiu1KZs9qJ2g8wSLbGX73SywtPbIVsV5AtlwB6aiu/6yjyF8oXrln76w85uYi3dKJp12Xk4sfPegIEAxtixT1PM3XOAS1QzGY6JYuATUsCoKAOcud1pjR3EckstPI+wsD5yQ7FQgEZTkvh4G3s3MkqHFx3X5ipsr5oZZnUmMDs1bbZlg+d6+s36ditTXYPHFnBjIpBhQ2YsC8lTahDs2PSE+bGVpTOlhvkJivKOlWAFi3copLsPAU6
x-ms-exchange-antispam-messagedata: XZO52brDJAHJ3+PxK1fuveVaLFEYfsUmXTcKHnbM3rP/Wa/PHw6zi2/9c6GI5RHUbJh7PY3IE/XOd2wxXa5o94OrteS20L/qd8/ghd8dJM1E0WXcZUVnltZd5QBsM85eMlbvfuGqeHoqQlcnuejTNQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c478e5ab-e820-4fca-97b0-08d7da9b0843
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2020 02:26:08.8742 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eoLTGGaCC5oLd8nM2NyDPXc6nV1Jdidw3+g56BhXOHAm41Ca4npl+v8GMpHvkjVNnySX7dQcCR4HZj89R2NKYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6295
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0372QLoT001007
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 05/11] dm-zoned: introduce
 dmz_metadata_label() to format device name
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/04/07 2:28, Hannes Reinecke wrote:
> Introduce dmz_metadata_label() to format the device-mapper device
> name and use it instead of the device name of the underlying device.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

> ---
>  drivers/md/dm-zoned-metadata.c | 11 ++++++++++-
>  drivers/md/dm-zoned-reclaim.c  | 15 ++++++++-------
>  drivers/md/dm-zoned-target.c   | 17 ++++++++++-------
>  drivers/md/dm-zoned.h          |  4 +++-
>  4 files changed, 31 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index ae261bf6452c..f7ae57e78230 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -134,6 +134,8 @@ struct dmz_sb {
>  struct dmz_metadata {
>  	struct dmz_dev		*dev;
>  
> +	char			devname[BDEVNAME_SIZE];
> +
>  	sector_t		zone_bitmap_size;
>  	unsigned int		zone_nr_bitmap_blocks;
>  	unsigned int		zone_bits_per_mblk;
> @@ -265,6 +267,11 @@ unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd)
>  	return atomic_read(&zmd->unmap_nr_seq);
>  }
>  
> +const char *dmz_metadata_label(struct dmz_metadata *zmd)
> +{
> +	return (const char *)zmd->devname;
> +}
> +
>  /*
>   * Lock/unlock mapping table.
>   * The map lock also protects all the zone lists.
> @@ -2445,7 +2452,8 @@ static void dmz_cleanup_metadata(struct dmz_metadata *zmd)
>  /*
>   * Initialize the zoned metadata.
>   */
> -int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
> +int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata,
> +		     const char *devname)
>  {
>  	struct dmz_metadata *zmd;
>  	unsigned int i, zid;
> @@ -2456,6 +2464,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
>  	if (!zmd)
>  		return -ENOMEM;
>  
> +	strcpy(zmd->devname, devname);
>  	zmd->dev = dev;
>  	zmd->mblk_rbtree = RB_ROOT;
>  	init_rwsem(&zmd->mblk_sem);
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index 95d2c8870480..c46159b6fc46 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -481,15 +481,16 @@ static void dmz_reclaim_work(struct work_struct *work)
>  		zrc->kc_throttle.throttle = min(75U, 100U - p_unmap_rnd / 2);
>  	}
>  
> -	dmz_dev_debug(zrc->dev,
> -		      "Reclaim (%u): %s, %u%% free rnd zones (%u/%u)",
> -		      zrc->kc_throttle.throttle,
> -		      (dmz_target_idle(zrc) ? "Idle" : "Busy"),
> -		      p_unmap_rnd, nr_unmap_rnd, nr_rnd);
> +	DMDEBUG("(%s): Reclaim (%u): %s, %u%% free rnd zones (%u/%u)",
> +		dmz_metadata_label(zmd),
> +		zrc->kc_throttle.throttle,
> +		(dmz_target_idle(zrc) ? "Idle" : "Busy"),
> +		p_unmap_rnd, nr_unmap_rnd, nr_rnd);
>  
>  	ret = dmz_do_reclaim(zrc);
>  	if (ret) {
> -		dmz_dev_debug(zrc->dev, "Reclaim error %d\n", ret);
> +		DMDEBUG("(%s): Reclaim error %d\n",
> +			dmz_metadata_label(zmd), ret);
>  		if (!dmz_check_bdev(zrc->dev))
>  			return;
>  	}
> @@ -525,7 +526,7 @@ int dmz_ctr_reclaim(struct dmz_dev *dev, struct dmz_metadata *zmd,
>  	/* Reclaim work */
>  	INIT_DELAYED_WORK(&zrc->work, dmz_reclaim_work);
>  	zrc->wq = alloc_ordered_workqueue("dmz_rwq_%s", WQ_MEM_RECLAIM,
> -					  dev->name);
> +					  dmz_metadata_label(zmd));
>  	if (!zrc->wq) {
>  		ret = -ENOMEM;
>  		goto err;
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index f4e3be7f9474..c2c3aa090f97 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -782,7 +782,8 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  
>  	/* Initialize metadata */
>  	dev = dmz->dev;
> -	ret = dmz_ctr_metadata(dev, &dmz->metadata);
> +	ret = dmz_ctr_metadata(dev, &dmz->metadata,
> +			       dm_table_device_name(ti->table));
>  	if (ret) {
>  		ti->error = "Metadata initialization failed";
>  		goto err_dev;
> @@ -811,8 +812,9 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	/* Chunk BIO work */
>  	mutex_init(&dmz->chunk_lock);
>  	INIT_RADIX_TREE(&dmz->chunk_rxtree, GFP_NOIO);
> -	dmz->chunk_wq = alloc_workqueue("dmz_cwq_%s", WQ_MEM_RECLAIM | WQ_UNBOUND,
> -					0, dev->name);
> +	dmz->chunk_wq = alloc_workqueue("dmz_cwq_%s",
> +					WQ_MEM_RECLAIM | WQ_UNBOUND, 0,
> +					dmz_metadata_label(dmz->metadata));
>  	if (!dmz->chunk_wq) {
>  		ti->error = "Create chunk workqueue failed";
>  		ret = -ENOMEM;
> @@ -824,7 +826,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	bio_list_init(&dmz->flush_list);
>  	INIT_DELAYED_WORK(&dmz->flush_work, dmz_flush_work);
>  	dmz->flush_wq = alloc_ordered_workqueue("dmz_fwq_%s", WQ_MEM_RECLAIM,
> -						dev->name);
> +						dmz_metadata_label(dmz->metadata));
>  	if (!dmz->flush_wq) {
>  		ti->error = "Create flush workqueue failed";
>  		ret = -ENOMEM;
> @@ -839,9 +841,10 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  		goto err_fwq;
>  	}
>  
> -	dmz_dev_info(dev, "Target device: %llu 512-byte logical sectors (%llu blocks)",
> -		     (unsigned long long)ti->len,
> -		     (unsigned long long)dmz_sect2blk(ti->len));
> +	DMINFO("(%s): Target device: %llu 512-byte logical sectors (%llu blocks)",
> +	       dmz_metadata_label(dmz->metadata),
> +	       (unsigned long long)ti->len,
> +	       (unsigned long long)dmz_sect2blk(ti->len));
>  
>  	return 0;
>  err_fwq:
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index c1b7b9a729c2..f7df7f67e404 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -163,7 +163,8 @@ struct dmz_reclaim;
>  /*
>   * Functions defined in dm-zoned-metadata.c
>   */
> -int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **zmd);
> +int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **zmd,
> +		     const char *devname);
>  void dmz_dtr_metadata(struct dmz_metadata *zmd);
>  int dmz_resume_metadata(struct dmz_metadata *zmd);
>  
> @@ -174,6 +175,7 @@ void dmz_unlock_metadata(struct dmz_metadata *zmd);
>  void dmz_lock_flush(struct dmz_metadata *zmd);
>  void dmz_unlock_flush(struct dmz_metadata *zmd);
>  int dmz_flush_metadata(struct dmz_metadata *zmd);
> +const char *dmz_metadata_label(struct dmz_metadata *zmd);
>  
>  unsigned int dmz_id(struct dmz_metadata *zmd, struct dm_zone *zone);
>  sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone);
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

