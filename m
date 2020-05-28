Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC421E54E6
	for <lists+dm-devel@lfdr.de>; Thu, 28 May 2020 06:09:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590638947;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nEjq7LyVzVwoYmpfnDv0006zC7ixA9fT70mSHO3eo7o=;
	b=cv8srlW41tQ1QIGTjS3U6dSvNbmT5BwlZtHRKcdWcQCvZBxSs5/9OT1CYF+T/2UD+r8J/x
	CynaM8eg3P6eyAeCYFCBBKcMD+mQSiOWPSa7d+a9fY79JJNblPkvqcXh/HrRq+Oc01nQuF
	9rTnAqrTnnHDx0f4jPB0PuCiYOgcyL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-YS41-qmZM4i3SdspAP9OPQ-1; Thu, 28 May 2020 00:09:05 -0400
X-MC-Unique: YS41-qmZM4i3SdspAP9OPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1E071009615;
	Thu, 28 May 2020 04:08:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D728599E1;
	Thu, 28 May 2020 04:08:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D78F61809542;
	Thu, 28 May 2020 04:08:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04S48Nul002656 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 28 May 2020 00:08:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2ED29202696B; Thu, 28 May 2020 04:08:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1331A2029F62
	for <dm-devel@redhat.com>; Thu, 28 May 2020 04:08:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D89F802641
	for <dm-devel@redhat.com>; Thu, 28 May 2020 04:08:20 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-359-fRxIuiJkOm6CxV8Yz2kvgw-1; Thu, 28 May 2020 00:08:16 -0400
X-MC-Unique: fRxIuiJkOm6CxV8Yz2kvgw-1
IronPort-SDR: Ar7ZvsAebQ65bP9WkvIDHcfAQRkgFPb68chPi/kkxXNtRKEUf5yDk9wHG0xo3cipGiwyD/UpPR
	309se2ki38bc/y8bT5JOuTpKZX7WAPAPFoxHhsje4NYmFtzp67bpZbIesyM4DIWJxpRQNzz9d6
	NpJhaQA3Ko4E1w0C+Bx44avI609uKApnjuoO/itN4xMDlMyX97SQubGSz6JQybPO3MBHTJ/Y4D
	8jy41VVM8iN9rZglmRpoXAS6ecZa3HqCEGKI8VbRW6Bsx7XHpJ7cy7DQehLcqBzlPTv/IAAc9a
	dNw=
X-IronPort-AV: E=Sophos;i="5.73,443,1583164800"; d="scan'208";a="138999653"
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
	by ob1.hgst.iphmx.com with ESMTP; 28 May 2020 12:08:15 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (10.172.142.14) by
	CY4PR04MB1143.namprd04.prod.outlook.com (10.173.188.138) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.3045.17; Thu, 28 May 2020 04:08:14 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3021.029;
	Thu, 28 May 2020 04:08:14 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "snitzer@redhat.com" <snitzer@redhat.com>, "hare@suse.de" <hare@suse.de>
Thread-Topic: [PATCH 13/15] dm-zoned: allocate zone by device index
Thread-Index: AQHWM+89YyBYJBoKJUKbmDE8V/aNnqi841YA
Date: Thu, 28 May 2020 04:08:13 +0000
Message-ID: <f38d9c9802239e3021b602af8c178428d72e791b.camel@wdc.com>
References: <20200527062225.72849-1-hare@suse.de>
	<20200527062225.72849-14-hare@suse.de>
In-Reply-To: <20200527062225.72849-14-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 (3.36.2-1.fc32)
x-originating-ip: [2400:2411:43c0:6000:62d1:16e6:ecb1:d604]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 209970fd-3519-43be-51f8-08d802bcbe26
x-ms-traffictypediagnostic: CY4PR04MB1143:
x-microsoft-antispam-prvs: <CY4PR04MB114360749FD7D97A33F636FDE78E0@CY4PR04MB1143.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o0dfUj7L/1qGphULoIljLrF0nmtcSF7Gjc58fDiwSmZCqICzrjwe9AqEWKFOFioYQMmdSRGS4XTdlxvmiAFjJrUSgO3ORrq9Swn8M1nleHyvXYPDbrOT3pz3hM/TE1P1uVkBnqWSASzCI2cVKG4Gr339jehEQxHHc8Ov/XbDANY/ektlTg2Uf8Gyy7yNPLWnK1CvQiQZ5QyjCNJmn5bTR5XmfC0uprQFrJCLwIEe6wVvVhLdzDPZbfO/NHx4XmbZ9VQ0OpVgECPyjtLKVgnT4mGBN1scJAthpGe7OF7bP6BSZILi3DMCLLm6sA1CAyyG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(6506007)(83380400001)(186003)(4326008)(6486002)(2616005)(71200400001)(8936002)(316002)(110136005)(478600001)(6512007)(64756008)(66446008)(66476007)(66556008)(91956017)(66946007)(36756003)(76116006)(8676002)(2906002)(86362001)(5660300002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: GWFQYrZ+ooFloDTOfHD8jHJG4bpKvpcaxhdP40rKnW8IKPwasPjJNDF6eJDKIDJwb4ULbKiI4yv03bYuBiUiRzh5nMf1uIl3bVS3v3g1/uGhlYP0Gun2RkwEYNlYR0tpwNJ1nAPRvp26BF5S7gvxQC4BKyQLkJ6q+CvfL43XP/gDYa5g3mlDv1bE52mKEY82J2BMbSAORDaZIK7GYEpqqJyvIa20XcMgBBo36+QPOrr3CwV0hs/2APIdP40qxJhpXPf2dMsHjmEISqtgRxSWAZ5Xu0y7imLIQKwBuHMTMkux+ZA4vSgX/LX1QLHtNE7bPnQILrBc3j13CiYRJhbCAXBAhRAqVDdVVZHz1ZjoWHBMKnYenXnrDB3cGDTOit/7GK6915qCd2AsaDANG9mUnYLLbLV72Wr+nyaQ2GAyDZXVxzdADRNgCitCsmJk7PIMTX+HAUUDS435690EJssneSu+uWsoBiL1kv8syTssfJ8++SaKqW722Ha3vprYjXLhIOlXDoqz1zuTUmMEvISkh4osJueBY45ApE1Ipkqth2xTptwtjplP4kElk2j6RNZf
x-ms-exchange-transport-forked: True
Content-ID: <AA2844876B46414F963E129039A249B1@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 209970fd-3519-43be-51f8-08d802bcbe26
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 04:08:13.8855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xL58oE/YjX3prc7HTWBeWgnGQ8URCL80z2BWgyG66QiQ8c4NN9IgxtGk97rr3CIjiPXkJtOGVZ0DuI1SjJ+KNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1143
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04S48Nul002656
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 13/15] dm-zoned: allocate zone by device index
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

On Wed, 2020-05-27 at 08:22 +0200, Hannes Reinecke wrote:
> When allocating a zone we should pass in an indicator on which
> device the zone should be allocated; this increases performance
> for a multi-device setup as then reclaim can allocate zones on
> the device for which reclaim is running.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 17 +++++++++++------
>  drivers/md/dm-zoned-reclaim.c  |  3 ++-
>  drivers/md/dm-zoned.h          |  3 ++-
>  3 files changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 689c1dd7ab20..0d65af94309a 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -2045,7 +2045,7 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
>  			goto out;
>  
>  		/* Allocate a random zone */
> -		dzone = dmz_alloc_zone(zmd, alloc_flags);
> +		dzone = dmz_alloc_zone(zmd, 0, alloc_flags);
>  		if (!dzone) {
>  			if (dmz_dev_is_dying(zmd)) {
>  				dzone = ERR_PTR(-EIO);
> @@ -2151,7 +2151,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
>  		goto out;
>  
>  	/* Allocate a random zone */
> -	bzone = dmz_alloc_zone(zmd, alloc_flags);
> +	bzone = dmz_alloc_zone(zmd, 0, alloc_flags);
>  	if (!bzone) {
>  		if (dmz_dev_is_dying(zmd)) {
>  			bzone = ERR_PTR(-EIO);
> @@ -2182,11 +2182,12 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
>   * Get an unmapped (free) zone.
>   * This must be called with the mapping lock held.
>   */
> -struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
> +struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned int dev_idx,
> +			       unsigned long flags)
>  {
>  	struct list_head *list;
>  	struct dm_zone *zone;
> -	unsigned int dev_idx = 0;
> +	int i = 0;
>  
>  again:
>  	if (flags & DMZ_ALLOC_CACHE)
> @@ -2202,8 +2203,12 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
>  		 */
>  		if (!(flags & DMZ_ALLOC_RECLAIM))
>  			return NULL;
> -		if (dev_idx < zmd->nr_devs) {
> -			dev_idx++;
> +		/*
> +		 * Try to allocate from other devices
> +		 */
> +		if (i < zmd->nr_devs) {
> +			dev_idx = (dev_idx + 1) % zmd->nr_devs;

Hu ? You deleted dev_idx declaration above...

> +			i++;
>  			goto again;
>  		}
>  
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index 18edf1b9bf52..5a04e34d17a9 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -288,7 +288,8 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  	/* Get a free random or sequential zone */
>  	dmz_lock_map(zmd);
>  again:
> -	szone = dmz_alloc_zone(zmd, alloc_flags | DMZ_ALLOC_RECLAIM);
> +	szone = dmz_alloc_zone(zmd, zrc->dev_idx,
> +			       alloc_flags | DMZ_ALLOC_RECLAIM);
>  	if (!szone && alloc_flags == DMZ_ALLOC_SEQ && dmz_nr_cache_zones(zmd)) {
>  		alloc_flags = DMZ_ALLOC_RND;
>  		goto again;
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index f2a760f62db5..ec020bb1caf7 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -214,7 +214,8 @@ bool dmz_dev_is_dying(struct dmz_metadata *zmd);
>  #define DMZ_ALLOC_SEQ		0x04
>  #define DMZ_ALLOC_RECLAIM	0x10
>  
> -struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags);
> +struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd,
> +			       unsigned int dev_idx, unsigned long flags);
>  void dmz_free_zone(struct dmz_metadata *zmd, struct dm_zone *zone);
>  
>  void dmz_map_zone(struct dmz_metadata *zmd, struct dm_zone *zone,

-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

