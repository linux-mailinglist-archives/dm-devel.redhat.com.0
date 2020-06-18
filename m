Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF0D1FE921
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 04:55:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592448958;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=EjuJnyoUpveEn+QUI6XnbdJ3oehXya4MpvWx4T9JAmg=;
	b=Eqvp2utTXkqOD6u3UvAh9Rh/68X+G78mIktuJjUBU7FEf2HU4SRnHlbHuiZ7Br+cNSQhnX
	3bhgFRGduqueEn0DD1Ld4NDkoEbHLkgDsFMpld70mkfCJzm/mc1aBWUp07h9PecgPO15ZT
	qXV8BYVvqpq1CFfeivpstHYhmSpsvq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-UdaTEGppP9GaLCNdQ2_htA-1; Wed, 17 Jun 2020 22:55:55 -0400
X-MC-Unique: UdaTEGppP9GaLCNdQ2_htA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51B8A107ACCD;
	Thu, 18 Jun 2020 02:55:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94F855C1D6;
	Thu, 18 Jun 2020 02:55:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A3A71809547;
	Thu, 18 Jun 2020 02:55:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05I2tb3q011188 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 22:55:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D42AEF11CD; Thu, 18 Jun 2020 02:55:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEDD2F11D1
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 02:55:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFA7B858EFE
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 02:55:34 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-117-x5xLiyrtN2akrU1XnJv2nw-1; Wed, 17 Jun 2020 22:55:30 -0400
X-MC-Unique: x5xLiyrtN2akrU1XnJv2nw-1
IronPort-SDR: VK22DRfrNzVmdsqQOhYo0ELFWsv1wlj7YajgF0++tYs2lxz7PngLJJb4ROzT6Fv1k4gxqV1821
	uw9tnwHmt+5kC3yzhRt+wwOcJz6lOJZ8dXgzfONmBUxbvluQAl0P1zdkpnp32ZqF9EqN+c2YIS
	vff2eDsj38T3qiTX0Mym1xWxbOneGdW3WGLtdl+803XKVLVPpxTdrV6490Jm78l6jkx0VzzuCG
	qu+L+qi5PfUXWNUwi0/4niQIyaqXsO1fIZZ3JeL8qeb/Gqnir0tCtZl7bYA+igYZ7Nv2YhjVRZ
	HH0=
X-IronPort-AV: E=Sophos;i="5.73,524,1583164800"; d="scan'208";a="243236864"
Received: from mail-sn1nam02lp2055.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.55])
	by ob1.hgst.iphmx.com with ESMTP; 18 Jun 2020 10:54:06 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB3750.namprd04.prod.outlook.com (2603:10b6:903:e2::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.24;
	Thu, 18 Jun 2020 02:53:17 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3088.028;
	Thu, 18 Jun 2020 02:53:17 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH] dm zoned: Fix metadata zone size check
Thread-Index: AQHWRRrptHRazGEhckqxXwFkJoXEsg==
Date: Thu, 18 Jun 2020 02:53:17 +0000
Message-ID: <CY4PR04MB375151DFB6741AD3515486ADE79B0@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200618024810.443981-1-shinichiro.kawasaki@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 31001235-5bcc-4f88-41c0-08d81332c07c
x-ms-traffictypediagnostic: CY4PR04MB3750:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR04MB3750E7970AF0E3342DD4B1F8E79B0@CY4PR04MB3750.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4OUoDZYHsDylLjzxGQDlWz5E2Yf3znKKT/ce3rbkfVPftzkvlAiDszb/vYTImfTSBe3vlLqqGwWDbdkTbiERR4dYxuPaTjwkaVEjXvBk65wj1U66cYgOqNl65LDFIuPY7iC478c1KoL/wu9zYlrPwViqnSZNx88rCM/B2wykqZ2RL1Dla5NccitzWxmi2nGgxG1QCuzESlL3rxf78ZIDSa5iJsR1vVHW03wOIHLl87aAs5UrOxy1ny43g/ef7Ysrk+Gf4gktv7F2c6AXrh1E1zvYKkIx58MhFRPN8uhiAZpFCr6EeVeacPyx1wXtTuVb0/OaLJS3HMgyB9QUWgb35A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(33656002)(110136005)(7696005)(52536014)(71200400001)(316002)(5660300002)(186003)(91956017)(8676002)(53546011)(86362001)(76116006)(66946007)(4326008)(8936002)(9686003)(66446008)(83380400001)(2906002)(66476007)(26005)(478600001)(66556008)(64756008)(6506007)(55016002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: t/E/OXABbnHsKrQdS0eebeqOH5Jj6ZJv1VD7w+pgBbmcLCYSJVMoTDM0lnkpVRGxvd356SRgJeYwQHbGstVGzBHCZhv82hB6gU7OdNknghTkmkbOzEfO89gjJBEG+UQJxcURMUbE9FwJZwd7VYSwaaxzQ7PDkvFx95Tn3J6ThYGgbcUzuNH2GqSttLwkbyQc9FRhYGWpBn8enWGvNB5k70sM5wiCqLdC/6MqcwkTA/EcSRuKdcyayTk91UktYkQvpMIjqJd7JBkeGKhW7e34IIqrP18PLXQqjCiZ7YUsbKgDXYu3FPxbSbDUccKSlMGSG17ugjFOrvtJJP+vWL3vNAoyAS0/SrkTFq54CzYvxZ1GRxTiGPHjZbaeEOKz/bn9PQDjUGgjwQKNK/Eox8raXv3D+IzTxPDmtfPo4+eA9/rsFiKtfrV6pkkhozQLtYH8RYUVttfovCengIwXg/K4zgzmfAYUyL5gYJdDK5VTJgk=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31001235-5bcc-4f88-41c0-08d81332c07c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 02:53:17.0766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l5ybjQ8CJYN1bTzfZzYNPsFEgu5cxRZSRg0QgfFb0G6SKO0u8HNpgIVtSv2aeFPbHFEQzXSnq3SnmG55aRcr/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB3750
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05I2tb3q011188
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm zoned: Fix metadata zone size check
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/06/18 11:48, Shin'ichiro Kawasaki wrote:
> When dm zoned has multiple devices, metadata is on the cache device, not
> in random zones of the zoned devices. Then the number of metadata zones
> shall be checked with the number of cache zones, not random zones.
> 
> Fixes: 34f5affd04c4 ("dm zoned: separate random and cache zones")
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> ---
>  drivers/md/dm-zoned-metadata.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 130b5a6d9f12..fc1329ca3e70 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -1078,7 +1078,8 @@ static int dmz_check_sb(struct dmz_metadata *zmd, struct dmz_sb *dsb,
>  	nr_meta_zones = (le32_to_cpu(sb->nr_meta_blocks) + zmd->zone_nr_blocks - 1)
>  		>> zmd->zone_nr_blocks_shift;
>  	if (!nr_meta_zones ||
> -	    nr_meta_zones >= zmd->nr_rnd_zones) {
> +	    (zmd->nr_devs <= 1 && nr_meta_zones >= zmd->nr_rnd_zones) ||
> +	    (zmd->nr_devs > 1 && nr_meta_zones >= zmd->nr_cache_zones)) {
>  		dmz_dev_err(dev, "Invalid number of metadata blocks");
>  		return -ENXIO;
>  	}
> 

Looks good to me.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

