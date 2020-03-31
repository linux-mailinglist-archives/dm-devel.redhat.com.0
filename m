Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 876AE198903
	for <lists+dm-devel@lfdr.de>; Tue, 31 Mar 2020 02:50:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585615800;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=omTIJ2EDZU8CTX/sNFN3YMHqzaBZ4BI2uTh443shoVU=;
	b=EOBCy3epsEdhtWX81NGAnQ5F/Dvq/OuXZe0JuDkgJtC7LQD7LLEE8UrG7LjAC1X41Gf96n
	iZFtHtZlrFaqeYphNkPTfK1MrM3NOFeSBw2xQtaMT8JA+RAT701Vo7jsykI6mxLuZr45PC
	ij1rNYO+2Zl3bL4o5ugQaGChaNPOAs8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-9azJM88nOuaB05Q_Fvxlzw-1; Mon, 30 Mar 2020 20:49:58 -0400
X-MC-Unique: 9azJM88nOuaB05Q_Fvxlzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A4BD13F7;
	Tue, 31 Mar 2020 00:49:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00C6919C58;
	Tue, 31 Mar 2020 00:49:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 87C3386BE1;
	Tue, 31 Mar 2020 00:49:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02V0nYPg027684 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 20:49:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 55ECB10D18D8; Tue, 31 Mar 2020 00:49:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 511F110D18DD
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 00:49:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EF408FF661
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 00:49:32 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-226-vk7CKV_kNEOfogjIDkpP9w-1; Mon, 30 Mar 2020 20:49:29 -0400
X-MC-Unique: vk7CKV_kNEOfogjIDkpP9w-1
IronPort-SDR: MZeqmi7kNu9VCCs+oYvW8FwalBA8w6U4xu9M3VwXzEq1OH6K+bGzSuWZPGDoHX/k8cJafww+c2
	z0GY/WwgUjUc9jhJaFDObzbkGfWE0s+OyUmK/gEeb2KiYwcXthUF3USKT9A8JpKgkmiiRuS5or
	lG47mzve3CLHv16bWP3865ftjJNNq3kMZu5fn9RjprAo8wDxckD9sB05ETFjzAPbalzvuGDdtf
	FBnHMxPdU8jsRuMChG/mmuYb0ZGYATJYM4T/IeoRwwMHsR1EHrKvFUhruQcrWS073XaqqQ7ua/
	JOs=
X-IronPort-AV: E=Sophos;i="5.72,326,1580745600"; d="scan'208";a="133919558"
Received: from mail-sn1nam04lp2051.outbound.protection.outlook.com (HELO
	NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.51])
	by ob1.hgst.iphmx.com with ESMTP; 31 Mar 2020 08:49:28 +0800
Received: from CO2PR04MB2343.namprd04.prod.outlook.com (2603:10b6:102:12::9)
	by CO2PR04MB2133.namprd04.prod.outlook.com (2603:10b6:102:13::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20;
	Tue, 31 Mar 2020 00:49:26 +0000
Received: from CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b]) by CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b%7]) with mapi id 15.20.2856.019;
	Tue, 31 Mar 2020 00:49:25 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 4/4] dm-zoned: allow for device size smaller than the
	capacity
Thread-Index: AQHWBAd4Lw970VOCKUuf0n+JOgdZJA==
Date: Tue, 31 Mar 2020 00:49:25 +0000
Message-ID: <CO2PR04MB2343240ACAC524067A074813E7C80@CO2PR04MB2343.namprd04.prod.outlook.com>
References: <20200327071459.67796-1-hare@suse.de>
	<20200327071459.67796-5-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6cb102a8-dbba-4f26-4447-08d7d50d5c6a
x-ms-traffictypediagnostic: CO2PR04MB2133:
x-microsoft-antispam-prvs: <CO2PR04MB213385EF314B955F8821333CE7C80@CO2PR04MB2133.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CO2PR04MB2343.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(7696005)(6506007)(81166006)(110136005)(33656002)(54906003)(53546011)(71200400001)(8936002)(316002)(81156014)(4326008)(2906002)(9686003)(5660300002)(86362001)(26005)(76116006)(66946007)(186003)(8676002)(55016002)(91956017)(66476007)(66446008)(478600001)(66556008)(52536014)(64756008);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V+FgNK8yxSi+rCXnLFyquHgLLfWuC73fMyIIClOHO+t+ZYZrDlIqCzeoHLUeOxgOHEBa+Q2DWr2vzoFGXIYgPqJ+nNEhSFbvBZL83vLJ6nbKxqiW0Q455GN/abKZ8xnwQaMVrWxaV9PDzVM84TAYHRwclwFeAqisTGX3H9FRFu2bmAbYhjNnBFeGeL7ifT2M3yCGj+dR+CjiOVKOmUwKLE6it/ZGKXAXli7CHdRYNnHfc/XfDF6WeufUJxUK+75/WYb0sZHJSDS68kjECNwGYAh2yzATeQ7ME1F/Nu2gJmm7zWb4rTvwE6QHrO9BrCu9hRs/5tvocOcvID57AWICEe6cB8+22UJ71gIOK+dvjMohh5du6snAXLbVze/LSBb4GAkdbDtWvzbl5cVFshHl5eMLARqBk1jQ6SSlYjz+E82P0Umldh98mbiNj8SOAbSc
x-ms-exchange-antispam-messagedata: /n/RXxVr1MJ2Ji8epp39LPWipumk29F8j2pqwudfXBVyk94fn8VhCBF3Nny+K2kc5HVLq+1YA+HfVvN6Po7XbdTL/DExaRK+pW0xkwTath27M0JfcgDTxQMTdxAcQxXvkkkoJeQzyZYQT8O91smgkg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb102a8-dbba-4f26-4447-08d7d50d5c6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 00:49:25.7444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6maTuX4TLp25sLEoqMl5Sew39yEQ80AylXqlUx+5VDCFX02pyFOaIFa3OHd+h+4mhPwjNbscJCl4OaA6UodLQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2133
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02V0nYPg027684
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 4/4] dm-zoned: allow for device size smaller
 than the capacity
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

On 2020/03/27 16:15, Hannes Reinecke wrote:
> dm-zoned requires several zones for metadata and chunk bitmaps,
> so it cannot expose the entire capacity as the device size.
> Originally the code would check for the capacity being equal to
> the device size, which is arguably wrong.
> So relax this check and increase the interface version number
> to signal to userspace that it can set a smaller device size.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-target.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index 7ec9dde24516..89a825d1034e 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -715,7 +715,7 @@ static int dmz_get_zoned_device(struct dm_target *ti, char *path)
>  	aligned_capacity = dev->capacity &
>  				~((sector_t)blk_queue_zone_sectors(q) - 1);
>  	if (ti->begin ||
> -	    ((ti->len != dev->capacity) && (ti->len != aligned_capacity))) {
> +	    ((ti->len > dev->capacity) && (ti->len > aligned_capacity))) {
>  		ti->error = "Partial mapping not supported";

The message is now wrong. Also, the condition can now be simplified to:

if ((ti->begin + ti->len) > aligned_capacity) {

Since aligned capacity is equal or smaller than dev capacity. And we have to
account for the potential non-zero begin.

>  		ret = -EINVAL;
>  		goto err;
> @@ -1008,7 +1008,7 @@ static int dmz_message(struct dm_target *ti, unsigned int argc, char **argv,
>  
>  static struct target_type dmz_type = {
>  	.name		 = "zoned",
> -	.version	 = {1, 2, 0},
> +	.version	 = {1, 3, 0},
>  	.features	 = DM_TARGET_SINGLETON | DM_TARGET_ZONED_HM,
>  	.module		 = THIS_MODULE,
>  	.ctr		 = dmz_ctr,
> 

I do not think this is nearly enough: dmz_init_zones() is still considering the
entire drive and does a zone report from 0 on the backend bdev. It should start
at ti->begin and up to ti->begin+ti->len, no ?

Furthermore, this introduce a change in the meaning of the zone ID. Since this
is set to the index of the zone in the report (patch 1), if the mapping is
partial and the zone report does not start at 0, then zone ID is not zone number
on the device anymore. So dmz_start_block() needs to be offset by ti->begin
otherwise IOs will go to the wrong zones.


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

