Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6B9202207C9
	for <lists+dm-devel@lfdr.de>; Wed, 15 Jul 2020 10:51:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-vylCUUvNMo-eHx1KhbdYpQ-1; Wed, 15 Jul 2020 04:51:23 -0400
X-MC-Unique: vylCUUvNMo-eHx1KhbdYpQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65035107BEF8;
	Wed, 15 Jul 2020 08:51:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B44A17D82;
	Wed, 15 Jul 2020 08:51:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 50D7C180954D;
	Wed, 15 Jul 2020 08:51:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06F8p0h5000569 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jul 2020 04:51:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6DD612156708; Wed, 15 Jul 2020 08:51:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68DB02156A4D
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 08:50:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14A18100E7C6
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 08:50:58 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-147-XJQiKsC0PQyH73JheJ9iqA-1; Wed, 15 Jul 2020 04:50:55 -0400
X-MC-Unique: XJQiKsC0PQyH73JheJ9iqA-1
IronPort-SDR: /zvthy4pTD9W9mXI4Sbjbx7F30+V3KvGP+em8ISQ8FDgo9nVLNEfQYJFNsGFVDRK8hbYURVlfX
	M5gh6EIrHHP7e1iSRB/PSDfzWDGo1s2JtlZqPEdCxIzAT/F+SkBjnMSsOsAe+paq/EpBsX9e7i
	RVfPCkI7wESmzAv0z+IhJVuh1SpDUriZNoqDq79f/EPbwATZKysHaqUJBwK0q9Y6fplFWCuAZB
	RnpcpfvWQbsJmY1dgfno0vMVuw4xr5GqodKJB8NH/ytHSTDaRqNnt/fh3Qvrv6Ji5dh4El6rfz
	1wQ=
X-IronPort-AV: E=Sophos;i="5.75,354,1589212800"; d="scan'208";a="143805429"
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
	NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
	by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2020 16:49:52 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0727.namprd04.prod.outlook.com (2603:10b6:903:e5::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17;
	Wed, 15 Jul 2020 08:49:50 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::d9e5:135e:cfd9:4de0]) by
	CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::d9e5:135e:cfd9:4de0%7]) with mapi id 15.20.3174.022;
	Wed, 15 Jul 2020 08:49:50 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH] dm zoned: update atime for new buffer zones
Thread-Index: AQHWWoB0zV9QyKKjmU6nsllVeV1Qpw==
Date: Wed, 15 Jul 2020 08:49:50 +0000
Message-ID: <CY4PR04MB37511C00F22BDC73456FC252E77E0@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200715081752.28130-1-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9d5550ba-5296-41ce-64aa-08d8289c08ed
x-ms-traffictypediagnostic: CY4PR04MB0727:
x-microsoft-antispam-prvs: <CY4PR04MB0727712E7A8F618E14760FBCE77E0@CY4PR04MB0727.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jbcdEQqRKvDFyB6RxFHpIn8s65zoQzI4Anbb1wjZCRTiscHdWKaVOGaTxCnvNuWHeirgUBcWZBott97C2KGqMyhAM92OdQm+AcAucTWrGBMhpdhxvlHcyxzQCl8fmpooFJW6+DLJ6+86JN/6/t7iGgwlVOa9cJXzy6VTITx+yK3sL+1C25LvRC75k+XhYIzOTZK28tLZjOiu2RM+ZfM7X5HUL7bjrk21auWhNYNO9YyAN3LmP4HpDLdHLGUJXRIvnoUufheKed1gfcnFB2ezXDqvBrpzy3npGVh/1upVsSo/+/HDJVoNVNNT66dtoK57C2noSsWsljrHsxelPYKMiw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(316002)(9686003)(110136005)(33656002)(7696005)(478600001)(76116006)(83380400001)(52536014)(15650500001)(66446008)(5660300002)(66476007)(66946007)(64756008)(66556008)(55016002)(91956017)(2906002)(4326008)(71200400001)(26005)(186003)(86362001)(6506007)(8936002)(53546011)(8676002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: 3RPFeISFRC4eNzFNMphpf1Loe99yuwBKtXJP5vZheT88ypoM4xhT7+IRKaHbOlSk1756+GrSky8SrUl4DPJHzk31GCIDhl3b/smCi0lmMSXEpT6eeyDlhI/xqP/je5xmDHzW9MbbKUQEAW7nT52DWP8F5tNGrAdExHbE/H+szkggVumx93lRiEByLCsFK1I2pzAgRUCuyjWbfGf8mTKAaLoMXW9XiBYkpF0G8++NBdVZdYE/bzrglzevNPGWIMC25/N+g/4SToO9HvTzdyAxGo9xgqtFl7n1OacthboGUMYhkPsp2X/R5afUPG1ZkuLsa0Ac1mDL8xKYKe1zkq94sOoWDUOHsOFUw36uBQS/TRy4oysuWEcC3QiIOwmnzbJhjMYKNwCcIxu/L5A8oh5lRxOpU846FZUlj041GhLUDv5PiVAQPdjUhvJ2Qohje14JKLBWm+vCS12D7YgWptROK8LmUi2VJDIFAXdJtXRFJmNi9YeaHjoU4MyhtB+dkvE7
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5550ba-5296-41ce-64aa-08d8289c08ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2020 08:49:50.1440 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y9tJSiDmeNypn4wpb4QHSNIiURSIbGZwHrB86hSXykYS9e4RKaL+t04+b0ml5+45ywL77jtWf9lgKmIN2KPKEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0727
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06F8p0h5000569
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm zoned: update atime for new buffer zones
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/07/15 17:18, Hannes Reinecke wrote:
> When a new buffer zone is allocated in dmz_handle_buffered_write()
> we should update the 'atime' to inform reclaim that this zone has
> been accessed.
> Otherwise we end up with the pathological case where the first write
> allocates a new buffer zone, but the next write will start reclaim
> before processing the bio. As the atime is not set reclaim declares
> the system idle and reclaims the zone. Then the write will be processed
> and re-allocate the very same zone again; this repeats for every
> consecutive write, making for a _very_ slow mkfs.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-target.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index cf915009c306..b32d37bef14f 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -297,6 +297,9 @@ static int dmz_handle_buffered_write(struct dmz_target *dmz,
>  	if (dmz_is_readonly(bzone))
>  		return -EROFS;
>  
> +	/* Tell reclaim we're doing some work here */
> +	dmz_reclaim_bio_acc(bzone->dev->reclaim);
> +
>  	/* Submit write */
>  	ret = dmz_submit_bio(dmz, bzone, bio, chunk_block, nr_blocks);
>  	if (ret)

This is without a cache device, right ? Otherwise, since the cache device has no
reclaim, it would not make much sense.

In fact, I think that the atime timestamp being attached to each device reclaim
structure is a problem. We do not need that since we always trigger reclaim for
all drives. We only want to see if the target is busy or not, so atime should be
attached to struct dmz_metadata.

That will simplify things since we will not need to care about which zone/which
device is being accessed to track activity. We can just have:

	dmz_reclaim_bio_acc(dmz->metadata);

Thoughts ?

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

