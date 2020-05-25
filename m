Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A79481E04A4
	for <lists+dm-devel@lfdr.de>; Mon, 25 May 2020 04:19:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590373155;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=EJPafPWnsZtQOhZarbuawKiLTAlmAF6Hqbz87ckm/SQ=;
	b=ExkhoMxItPXm70apzQzUD1pAuxaHYlZNXDVicdeyTCexeBYuZJMPx4UnVpdnh8nAznIik7
	kDy6cK9i4r3VGYspg5avpXYL3cE9FrXk3a3O9FK2SThPtVixyHHO2xcmRqFF+ZLyX6ReZi
	fD1BvnyfN120hMAiGku6QwI/H0ZJF4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-S7K2J4sTP1qCfAfIeKCpBw-1; Sun, 24 May 2020 22:19:13 -0400
X-MC-Unique: S7K2J4sTP1qCfAfIeKCpBw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FF5B107ACF4;
	Mon, 25 May 2020 02:19:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA5E36ED9C;
	Mon, 25 May 2020 02:19:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 12C851809543;
	Mon, 25 May 2020 02:19:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04P2Is4t032389 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 24 May 2020 22:18:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 24D5820110D9; Mon, 25 May 2020 02:18:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0C21200A773
	for <dm-devel@redhat.com>; Mon, 25 May 2020 02:18:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E9BA1859160
	for <dm-devel@redhat.com>; Mon, 25 May 2020 02:18:51 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-343-YDrOMB8vNfyh8wrQkQNa6A-1; Sun, 24 May 2020 22:18:48 -0400
X-MC-Unique: YDrOMB8vNfyh8wrQkQNa6A-1
IronPort-SDR: WjqbbIPliB+I/36VQy58QiVKkJkWYy+ZFiCaZwaCxpKJfYOr9iPjrFFYCsUxzG+No36On8N/c/
	O5Qkp/PneHsscN4j+06j+4C86UUWp6i0ITtgUZtllGLhkE9/ksbVnovVTwo3wmpotCPExFMLMN
	LDM6eTK8WfF6I0LxGQZGcabLYd8FDLvCj20wRYQyoSw24u94ITpX1Hp2qVIiWmopo9hL1amF7T
	5AD4pfoGLwfnxe3AoI+5B9inej53f0MNO7CTk4hwsnZHT16fK+ClJd6Dt3YuAwyYQYT2GZ/9zb
	42o=
X-IronPort-AV: E=Sophos;i="5.73,431,1583164800"; d="scan'208";a="241215072"
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
	by ob1.hgst.iphmx.com with ESMTP; 25 May 2020 10:19:12 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0167.namprd04.prod.outlook.com (2603:10b6:903:3b::10)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24;
	Mon, 25 May 2020 02:18:45 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3021.029;
	Mon, 25 May 2020 02:18:45 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>
Thread-Topic: [PATCH 07/12] dm-zoned: add a 'reserved' zone flag
Thread-Index: AQHWME8mjKsxiPB5eEyarTcxx+AkHg==
Date: Mon, 25 May 2020 02:18:45 +0000
Message-ID: <CY4PR04MB37515F9D681D8473A968CC4FE7B30@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200522153901.133375-1-hare@suse.de>
	<20200522153901.133375-8-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 044cfedc-f020-49c6-3d69-08d80051f3c4
x-ms-traffictypediagnostic: CY4PR04MB0167:
x-microsoft-antispam-prvs: <CY4PR04MB016733CB90480B567030D263E7B30@CY4PR04MB0167.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j7Hoz2pTHpHf3TT5cV/5O3qAyH3bOoo/HnwjzHbOukoYQYmoamFRj0M4E75h0PA5hs3xI3u6nnYL8RyPP1HTamXaX6Dew7lR8Tvr8PwvwcAnOqaCHY2DddyJHZLOXfplXU3J8NqclfOfSYqo+oUb53mNCdXnXhIVeU2KcsFwhxU4Zq3GVkByKf54bYr1M5cGfRB8Sjcci9T/+2GKs+8LY0zELqlOECuMJmbgFYe4RE1RHAQ87/MyUo722lo3rdl0pAiV76stYYqz7WBnBfQ1EA/GtKtdRAm+zExqu4bgTSQkHmfEctH/Z1neRJTownW39Kkjq5+8ikksNe6pOCAbMg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(6916009)(76116006)(5660300002)(66446008)(91956017)(66946007)(66556008)(71200400001)(64756008)(66476007)(52536014)(9686003)(55016002)(8676002)(54906003)(478600001)(316002)(6506007)(53546011)(8936002)(186003)(33656002)(4326008)(26005)(2906002)(7696005)(86362001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: kwpGxkS0Go3DuKFCm6celS5l0e13GwxSArS+CvKW4bM49i7i2RQnalYDkHaNQeHMysCb5rONz0w8UdnHYSthSvi2OLb4+aMlLsCD1iCW4iwF0H3gitasgSLEctBZ43PX6fFMF/NfuhTsLPtSNOaxEfJyVXO2+wfCST2VWEFVI8BQhh8IIEVd/irqCNXQNMyBYc7JSVdMasCwiclEUU2reNzeOJN8WPKJ/LClhH5aTO3B6dy6rok9RsXxxbaKhwgow7xOIupMb42Cx4HX8wfkwfLKhbZf08NGIOtsGEvFPpnTX/D+mnfsrCxoONgMS8hrJjWMzqQJ5pUo/gpiDIF5ThD9gIPAakANMD84mE0okgjSP6XcSgBbf+bSdpessIerYCEZAt/4gT+CHqZv726jlrbHiVw9HF44VLgZCmLyDquftKCh3xONMiyyDCQGaAECWUmifc4SQfmMocfJ3Ggm0kwO5wjNV7ULvhNboY1kXCI=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 044cfedc-f020-49c6-3d69-08d80051f3c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 02:18:45.3741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R9XBim0h3f8Kb1sneYKVcyAjtb0lyZie8WBxjlyaXdw0VJ4oR8mDOoAjcp39McLgTKgGPHOQNynSqx72+RiXIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0167
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04P2Is4t032389
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH 07/12] dm-zoned: add a 'reserved' zone flag
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

On 2020/05/23 0:39, Hannes Reinecke wrote:
> Instead of counting the number of reserved zones in dmz_free_zone()
> we should mark the zone as 'reserved' during allocation and simplify
> dmz_free_zone().
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 4 ++--
>  drivers/md/dm-zoned.h          | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 73479b4c8bca..1b9da698a812 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -1783,6 +1783,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  			atomic_inc(&zmd->unmap_nr_rnd);
>  		} else if (atomic_read(&zmd->nr_reserved_seq_zones) < zmd->nr_reserved_seq) {
>  			list_add_tail(&dzone->link, &zmd->reserved_seq_zones_list);
> +			set_bit(DMZ_RESERVED, &dzone->flags);
>  			atomic_inc(&zmd->nr_reserved_seq_zones);
>  			zmd->nr_seq--;
>  		} else {
> @@ -2210,8 +2211,7 @@ void dmz_free_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  	} else if (dmz_is_rnd(zone)) {
>  		list_add_tail(&zone->link, &zmd->unmap_rnd_list);
>  		atomic_inc(&zmd->unmap_nr_rnd);
> -	} else if (atomic_read(&zmd->nr_reserved_seq_zones) <
> -		   zmd->nr_reserved_seq) {
> +	} else if (dmz_is_reserved(zone)) {
>  		list_add_tail(&zone->link, &zmd->reserved_seq_zones_list);
>  		atomic_inc(&zmd->nr_reserved_seq_zones);
>  	} else {
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index dab701893b67..983f5b5e9fa0 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -130,6 +130,7 @@ enum {
>  	DMZ_META,
>  	DMZ_DATA,
>  	DMZ_BUF,
> +	DMZ_RESERVED,
>  
>  	/* Zone internal state */
>  	DMZ_RECLAIM,
> @@ -147,6 +148,7 @@ enum {
>  #define dmz_is_offline(z)	test_bit(DMZ_OFFLINE, &(z)->flags)
>  #define dmz_is_readonly(z)	test_bit(DMZ_READ_ONLY, &(z)->flags)
>  #define dmz_in_reclaim(z)	test_bit(DMZ_RECLAIM, &(z)->flags)
> +#define dmz_is_reserved(z)	test_bit(DMZ_RESERVED, &(z)->flags)
>  #define dmz_seq_write_err(z)	test_bit(DMZ_SEQ_WRITE_ERR, &(z)->flags)
>  #define dmz_reclaim_should_terminate(z) \
>  				test_bit(DMZ_RECLAIM_TERMINATE, &(z)->flags)
> 

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

