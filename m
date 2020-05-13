Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 868771D0C88
	for <lists+dm-devel@lfdr.de>; Wed, 13 May 2020 11:42:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589362973;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=5J0+/SFEDPAy17UQz+VTe1uJkWT/UTsAsFMQ4hSEFCg=;
	b=SLa3ydKYB949O0sKpM4+NiTshnGDA3Mli2TZs832LaALTr6TneY8vqHzzpCW2iVlsq1uX0
	90Xi1uDmBrEDN3wR78E6W5RMuFQiEO53tI5Hr2pIFrLEnI9FVIY9AGEAg8jprde2uZf/y6
	35P0joAYAfkv/Db0asf4dY/oLdo7CVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-BMfmz26rNHeXTzRaSLCK8Q-1; Wed, 13 May 2020 05:42:51 -0400
X-MC-Unique: BMfmz26rNHeXTzRaSLCK8Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDA841B18BC1;
	Wed, 13 May 2020 09:42:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24A5E62B1E;
	Wed, 13 May 2020 09:42:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E69BF1809542;
	Wed, 13 May 2020 09:42:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04D9ffuQ004890 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 05:41:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7F1B02156A2D; Wed, 13 May 2020 09:41:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A7522166B27
	for <dm-devel@redhat.com>; Wed, 13 May 2020 09:41:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BEEE101A525
	for <dm-devel@redhat.com>; Wed, 13 May 2020 09:41:38 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-297-KyAUq2I-NGW6whmHrBuvzQ-1; Wed, 13 May 2020 05:41:36 -0400
X-MC-Unique: KyAUq2I-NGW6whmHrBuvzQ-1
IronPort-SDR: ZvYwqFU5PykV7XcxG5ysOL2a4L7aqe6nj/PVJAy4bq9UZhXHPf6k7M2ussCYH8x80ALN0Exw+D
	iisLnJ0wg+U7s2lS/4/6RbtaEG4AHpBFMFc9E02QIwUILAvue3iu+jymRvOBbzy6aI/oiayxBM
	rimBpd2EP43cphB4GgyLy/HfHio1nkhXBN+AdeZLrHGXkW+lP/JQkBz4La724c6WaY4LeF8Kom
	8Y0Vj1l9RoVCfWM3OxUr7Ort8H86QBOP0ZUyE/c8K5CBtvAdr/6yPIEx8BynZIwBXiHNI/u7Oh
	v3A=
X-IronPort-AV: E=Sophos;i="5.73,387,1583164800"; d="scan'208";a="141916365"
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
	NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
	by ob1.hgst.iphmx.com with ESMTP; 13 May 2020 17:41:35 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6294.namprd04.prod.outlook.com (2603:10b6:a03:1e5::18)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34;
	Wed, 13 May 2020 09:41:33 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%6]) with mapi id 15.20.3000.016;
	Wed, 13 May 2020 09:41:33 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [dm-devel] [PATCH] device-mapper: use dynamic debug instead of
	compile-time config option
Thread-Index: AQHWKQqwAEUgt+4iJ0a7KKBQy34Fnw==
Date: Wed, 13 May 2020 09:41:33 +0000
Message-ID: <BY5PR04MB6900AD28F5B6B6C3A8AEAA5EE7BF0@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200513070843.71528-1-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 25d6e720-354b-4d8d-b37f-08d7f721d2d0
x-ms-traffictypediagnostic: BY5PR04MB6294:
x-microsoft-antispam-prvs: <BY5PR04MB62944D143CC54840DB223A71E7BF0@BY5PR04MB6294.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 0402872DA1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R1H+fCDRU0HQzvxxgiVS0Q8S9mnDhyEvb5GDpAAlKXc0suRU91d8mSeRTYGj53DnCWoyoi8+du8nl0VeXDlzThYlzKcYHY9J5dHSe9xsjL6zNbt2cx9bpAVSvig3d/712W/O/DJ41/dmUS3SwTHE9L9ILCQJqeLkJ5IkM9GK58v2IGwqGNkolRnkoINIhGc5zcrBvaLJxaa5P09WrbApWZitt5+jHiEcmpvaJjX8mCXihwlltoc+1OARApFjI/n/aTHeCuqHZmRW/Jng3Pj9TeClHQ9REzE+LY9RbaIgFg45GZuX0vuPrgbx+ztUL5Qinmy0+jUsc7/HcfNbyX0Z4VTuHHCAqRhiZo97Cxvyyu3TjAL5ugby2qT6RDSqBtDOFRm8oY/axrtkRFXtHdLaeX1SapGSuyrBVx9O2UBjrsBHpdM7s1rsnh6VmkugKpkbXwvWEm7Cs1nsbL+GGO4jaF+XdZ6jQ1rC9dYA0TEv030EiWXeB5eVeeibxgUOZvnWst01vEFUK57BryZ2Li9OQQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(33430700001)(53546011)(26005)(33656002)(4326008)(33440700001)(316002)(55016002)(52536014)(7696005)(9686003)(6506007)(2906002)(66476007)(64756008)(66446008)(8676002)(86362001)(186003)(5660300002)(66556008)(110136005)(71200400001)(8936002)(478600001)(76116006)(66946007);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: WJp2ud0pUEVXQBHj2B9gh5eXDl5rntR1h3Yq4unVM0VfvZ55oyR3cnjHiMKdeR2MmDyNszVtdYFic4d6dX5VA6V4UOzrzMRJtt1gjycLvHsIuDt1MZxwQ1ylyi/VC0R+jNC22GchqDreSJEwBmgM5JABCHFaAHFTarFu9jZ3jqisTgbPRtfj2ocICv7jHUpgHUEkOKhVyXv1eRcZiUkakO/SRX+uIVSMvuYU+N0zovl4o5mT5664OCHFysz9wKaHC8habARx2GB0025I+dduao39SjQmH1gVjC4x+WNPBmEVxxrGChetrusEtlBS7I8uh2NadepvhSIIfaXi9Gs5LrkQpeguNpkj56qodSYaaBSdWw+kXL1BAwfP7EQSFgp2dr7k8GD4ZPe3zLAkO1uJcH9mjZDXLF/FYw/QBd4ZuYibJze858IBGoPzTpdUS80SIUohbpagmV/SioxlhQN7gY5xNBMtHHBJOK2lRteoCmdOGG8JWeUTtL7X90dqxgO4
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d6e720-354b-4d8d-b37f-08d7f721d2d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2020 09:41:33.8053 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TGuRw7zU0vvwwnZHvmzRYHIMbsqLpOuWBMaoRhU2tu/uWjDHDkZUw1CIEtKeO3tiOK3/ikyEvuWGIRe/nn0Q+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6294
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04D9ffuQ004890
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] device-mapper: use dynamic debug instead of
 compile-time config option
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

On 2020/05/13 16:10, Hannes Reinecke wrote:
> Switch to use dynamic debug to avoid having recompile the kernel
> just to enable debugging messages.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  include/linux/device-mapper.h | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
> index e2d506dd805e..3d4365fd3001 100644
> --- a/include/linux/device-mapper.h
> +++ b/include/linux/device-mapper.h
> @@ -556,13 +556,8 @@ void *dm_vcalloc(unsigned long nmemb, unsigned long elem_size);
>  #define DMINFO(fmt, ...) pr_info(DM_FMT(fmt), ##__VA_ARGS__)
>  #define DMINFO_LIMIT(fmt, ...) pr_info_ratelimited(DM_FMT(fmt), ##__VA_ARGS__)
>  
> -#ifdef CONFIG_DM_DEBUG

Can we remove this from Kconfig as a config option ?

> -#define DMDEBUG(fmt, ...) printk(KERN_DEBUG DM_FMT(fmt), ##__VA_ARGS__)
> +#define DMDEBUG(fmt, ...) pr_debug(DM_FMT(fmt), ##__VA_ARGS__)
>  #define DMDEBUG_LIMIT(fmt, ...) pr_debug_ratelimited(DM_FMT(fmt), ##__VA_ARGS__)
> -#else
> -#define DMDEBUG(fmt, ...) no_printk(fmt, ##__VA_ARGS__)
> -#define DMDEBUG_LIMIT(fmt, ...) no_printk(fmt, ##__VA_ARGS__)
> -#endif
>  
>  #define DMEMIT(x...) sz += ((sz >= maxlen) ? \
>  			  0 : scnprintf(result + sz, maxlen - sz, x))
> 

Otherwise, looks good to me.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

