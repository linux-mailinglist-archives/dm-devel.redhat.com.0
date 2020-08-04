Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B56AE23B8AC
	for <lists+dm-devel@lfdr.de>; Tue,  4 Aug 2020 12:20:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-4wEgKjUnNoOcH9f8NSM_iQ-1; Tue, 04 Aug 2020 06:20:13 -0400
X-MC-Unique: 4wEgKjUnNoOcH9f8NSM_iQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF4E8107BEFD;
	Tue,  4 Aug 2020 10:20:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FDF810023A7;
	Tue,  4 Aug 2020 10:20:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B7F41809554;
	Tue,  4 Aug 2020 10:19:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 074AJROc008037 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 4 Aug 2020 06:19:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CAFBCE2A9A; Tue,  4 Aug 2020 10:19:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4E47EAFA4
	for <dm-devel@redhat.com>; Tue,  4 Aug 2020 10:19:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC36A805C21
	for <dm-devel@redhat.com>; Tue,  4 Aug 2020 10:19:24 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-18-n1IknbUfOQOaCdyfkbdCuA-1; Tue, 04 Aug 2020 06:19:20 -0400
X-MC-Unique: n1IknbUfOQOaCdyfkbdCuA-1
IronPort-SDR: 9qST+b6EWv8iNFXlx9Ls7MGYT2Obbf1xw5WNznja83BNpR9oLwrSmMtw38+EeYEa4PIyhOCcBz
	abY16zQDKvbryZy13KbGzDnM6KJNHejcIRNRTT7mNRnU3yzPA69J3jQ/415JF/pjoygSxDp9ru
	/QH6P+/jczzBiaYL3lgLF5GhOBQJ3+7G82QfmZHLFxQDNRMT+cf0PYKU1LHW3/JGFiIJsh4W07
	nI7TCVun0+fsDGL0ajKEvgHpGn8x/idtjoqdoAbTPFo+V1ByGR/Or9fRsBx3PK8BvKCrSVnqjd
	csE=
X-IronPort-AV: E=Sophos;i="5.75,433,1589212800"; d="scan'208";a="247197328"
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
	by ob1.hgst.iphmx.com with ESMTP; 04 Aug 2020 18:17:29 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR0401MB3585.namprd04.prod.outlook.com (2603:10b6:910:8a::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.21;
	Tue, 4 Aug 2020 10:17:14 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::7d15:9936:4b3b:f8a2]) by
	CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::7d15:9936:4b3b:f8a2%12]) with mapi id 15.20.3239.021;
	Tue, 4 Aug 2020 10:17:14 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>, Mike Snitzer
	<snitzer@redhat.com>
Thread-Topic: [PATCH] dm: don't call report zones for more than the user
	requested
Thread-Index: AQHWakEnDK0PwnclYUCJoRsBiHaPCQ==
Date: Tue, 4 Aug 2020 10:17:14 +0000
Message-ID: <CY4PR04MB3751EB538B7F29FBDBB4EBA4E74A0@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200804092501.7938-1-johannes.thumshirn@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 18aea11c-18fd-4ad2-f1a7-08d8385f8f10
x-ms-traffictypediagnostic: CY4PR0401MB3585:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR0401MB3585A8C16D4AD92E8970B9E9E74A0@CY4PR0401MB3585.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d9LsQY01wMG3gtJ+gfhBjSOrhP0XnO95aNjTvHYYhAqPuL70sQwOW0Hcb1CKox6KYddlWv44E+83i9D0aioL5uZwHLKtOrkNGRu+3GVQeKQZqzypPQ+HSkxbEmaBC04Ptm0YCW4lABCkCIfVof3+Scc5aXNy9QQutfjRzdnFiEi3vu2Yh3nX1a2Ztmy0bAUNwxl2Ve2WbJMJl3mljA7pn1ZJOoqNu1qbgZWSFb5SlWFkyZXmJ6PR7KGu6+qqpL0252BlkIpn51gnRrEoiwd98vt+O9fXSXo4sUfEucmVt4SI2ovB/NNjzArkmTKAEmZ6/r52xkdJatDAzUekmYWhLg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(64756008)(66946007)(66476007)(316002)(110136005)(76116006)(186003)(71200400001)(8936002)(4326008)(91956017)(66556008)(66446008)(8676002)(54906003)(53546011)(26005)(6506007)(5660300002)(55016002)(83380400001)(33656002)(2906002)(86362001)(478600001)(9686003)(52536014)(7696005);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: M2eydkx7QvLXrRGvVop0u20FEC5S6OQ1Mh+wWcE4Qa9UixUS9eOxYhoHqFhpLuUQfwkr+pLvJU5xYaZ1sm69rOdgrTUdqHur+U628B1dBBf2ezEjFCrn+pBW2yRaFgAtgpJ2sOsd1hce1ZYfHwFB3Bzb5Ez6vqUYObFq0OcUQHrOewFMPVG7vLWzIEOZrEbdfancpbVQlIoVq2t1JywZqymGe+g8Heis01q7jfMy74nNMOUNZKlXpS75+VxiicMeA1I0w1fc9Bna0+y2zs27it2iZkXoYWmAJ1isrFRjkNxAFrm4UORyAXaoW1tJzoPEKEEHITMi8Zg5c7AOXmgrcnfPHybeeeyewxZdiZQ9gjEfFfBESGUVi7J7WE06grYECaqwWMNCtLd2X8LvFPGuCKvA7rqg/lo9COZY9QdqQzhxK+0xCtjCg6Z0yoNf4beEuSUqtMrpTlUHM8gArgTWwbNsIr6eP2q/9BSV3OkGosgkeG7B6i//7KyND2JhY+5TOOC3+IPszpKWLwAaTVkCmIIo8jdkn5L2czcVBijeAXScAXwnC5wImJzHNY3uVwnKT2M3v2x/UcSHcrt1CItTLD5FSZjDrWuHA3lLnNg8wR+GWXS/CRlgYPPNigzDLaJAs07HtY+py94B+kgqLlvZew==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18aea11c-18fd-4ad2-f1a7-08d8385f8f10
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2020 10:17:14.5336 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AJZf8nyrDKOchwhErRoigfF/ANFgmHVZHCMsm9VZyZ4fA34rZCvFcEwJTyjvl7Zew06jtJUHGofQJHCGQWBRhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0401MB3585
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 074AJROc008037
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Naohiro Aota <Naohiro.Aota@wdc.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm: don't call report zones for more than
 the user requested
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

On 2020/08/04 18:25, Johannes Thumshirn wrote:
> Don't call report zones for more zones than the user actually requested,
> otherwise this can lead to out-of-bounds accesses in the callback
> functions.
> 
> Such a situation can happen if the target's ->report_zones() callback
> function returns 0 because we've reached the end of the target and then
> restart the report zones on the second target.
> 
> We're again calling into ->report_zones() and ultimately into the user
> supplied callback function but when we're not subtracting the number of
> zones already processed this may lead to out-of-bounds accesses in the
> user callbacks.
> 
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> ---
>  drivers/md/dm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index 5b9de2f71bb0..88b391ff9bea 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -504,7 +504,8 @@ static int dm_blk_report_zones(struct gendisk *disk, sector_t sector,
>  		}
>  
>  		args.tgt = tgt;
> -		ret = tgt->type->report_zones(tgt, &args, nr_zones);
> +		ret = tgt->type->report_zones(tgt, &args,
> +					      nr_zones - args.zone_idx);
>  		if (ret < 0)
>  			goto out;
>  	} while (args.zone_idx < nr_zones &&
> 

Looks good. I think this needs a Cc: stable.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

