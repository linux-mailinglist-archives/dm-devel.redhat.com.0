Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A77B41E55FB
	for <lists+dm-devel@lfdr.de>; Thu, 28 May 2020 07:15:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590642958;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8anklZnnROjGXijn/parOq7jyhr9GVwmBdjMt/7csek=;
	b=KZkpDoIwGycfdECeoeStzu2uWwIckq84Vo0+icE6wDsPoRh37q0x5vwwbp0Pjs0bNGZCtZ
	/Nl/iVufB1QBeOsnyMNDoXktGY/5EjdAUZEoa9agx35q8l2HQxnMYE2+KzDGvnnoNdXdcE
	VZy+0BPehyNjty2AXLMVExcD6gK5Wyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-ZK8P8Y7vNVmRoqIBGRy-YQ-1; Thu, 28 May 2020 01:15:55 -0400
X-MC-Unique: ZK8P8Y7vNVmRoqIBGRy-YQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F1CF107ACCA;
	Thu, 28 May 2020 05:15:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7EDC1001268;
	Thu, 28 May 2020 05:15:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 15A0C6B556;
	Thu, 28 May 2020 05:15:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04S5FKN2006589 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 28 May 2020 01:15:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D824F2156A22; Thu, 28 May 2020 05:15:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3ED32166BA4
	for <dm-devel@redhat.com>; Thu, 28 May 2020 05:15:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3183833B47
	for <dm-devel@redhat.com>; Thu, 28 May 2020 05:15:15 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-404-FeSB65AUND-kimZjDoFHsA-1; Thu, 28 May 2020 01:15:13 -0400
X-MC-Unique: FeSB65AUND-kimZjDoFHsA-1
IronPort-SDR: T15YWJc5+CpOeabkr/ua1dUCWc3ahkqZCzRK6joi5uvCzsFI/p0XEIn83zVAGPcLEb6vNA6YzB
	a8RER8QDDXlRuqpKTRnank+uhEERcuO7Va/FQQngsfzq+3ceEOmirGmSvjRJ8jKASvQ9LWZ/P7
	dZfXOt2NjSLqnk5ggtG2bPahfPGAKGcXY6hlXuO9K1/kwBwaqG9IegHSOT/GnH8tZWPn5C7xhb
	/LzCtBYLzSJlhccZ8QtyR1ST579XFL2E5bW8Plu8P7fLkr81dL/4smnpPuyupXbpq07mZb7dWz
	psE=
X-IronPort-AV: E=Sophos;i="5.73,443,1583164800"; d="scan'208";a="138675826"
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
	by ob1.hgst.iphmx.com with ESMTP; 28 May 2020 13:15:11 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0729.namprd04.prod.outlook.com (2603:10b6:903:e2::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19;
	Thu, 28 May 2020 05:15:10 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3021.029;
	Thu, 28 May 2020 05:15:10 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "snitzer@redhat.com" <snitzer@redhat.com>, "hare@suse.de" <hare@suse.de>
Thread-Topic: [PATCH 15/15] dm-zoned: prefer full zones for reclaim
Thread-Index: AQHWM+9Ht0Fa6k19R0SjntMCD7Nm/6i85aoAgAAQXwA=
Date: Thu, 28 May 2020 05:15:10 +0000
Message-ID: <83398d08cdc4f9d1bf16fa4dde3fab5ecb8d58d3.camel@wdc.com>
References: <20200527062225.72849-1-hare@suse.de>
	<20200527062225.72849-16-hare@suse.de>
	<ba3ed1771f0034a99d9d40bf9197b8ac969c0c5a.camel@wdc.com>
In-Reply-To: <ba3ed1771f0034a99d9d40bf9197b8ac969c0c5a.camel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 (3.36.2-1.fc32)
x-originating-ip: [2400:2411:43c0:6000:62d1:16e6:ecb1:d604]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0044e479-2469-4be2-7c77-08d802c61824
x-ms-traffictypediagnostic: CY4PR04MB0729:
x-microsoft-antispam-prvs: <CY4PR04MB072916068C7A45D12A33D470E78E0@CY4PR04MB0729.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xuOT4ykvGOSXoqLxWBla8bVi9TtQbnSGMahx26X2eLiTNS4Y4MRnzLZti+mNkuVsnBB5R4Qq3nUyqmoGPiZSYKBGwAa+0+dvmaWCUEtzDPG78WAJDDQXFVpWZg/82OohiYjiAlXChZngwDIPzzckhXLx3wi1PTHBLky10HebEUa7TzK6g7tUalxt2XYwXSf6DuxaT2WqQ4IE9Iml1Pr8zhhDs2q3epcuDd8Fdf7MNxMnDya/z5Q1AL3iU6OdSS1apnWUjhJ6838pyzCKVyc8jurH0gNlVEp+/f8LWYqU/NVSvXaY12teGdtYHjV/jb3S
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(6506007)(6486002)(4326008)(71200400001)(6512007)(186003)(2616005)(316002)(478600001)(83380400001)(8936002)(110136005)(66556008)(66476007)(66446008)(64756008)(36756003)(66946007)(76116006)(8676002)(91956017)(2906002)(86362001)(5660300002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: 7FOieONFLJa98J5d671Tai6HZQ0KIL90HcOfKSRFq6Ydlm8tqLb3RaF0VPtN2gNMpk6lnEFMIZYKbzpe54u4TkideWKT/P4LvP1cahaOlnwARev73ux/wF2laqo823XODEo/SN2nPsSVuR3c04MVlfparWtj6UsIRNeh7s1v9BO1EjiMWd9Va6zklkn69QI4FBxHOIkwQzeEXfS9Dw5X+CD3hVBcU4ydBpIGxeokZ6AODOO3iFmLxYXgcT/7nlq02wPG1AASbANmDKQlsyuq2u9cF9p4KRVLxkxzwGqzXmnxKAioEy1MY/ZCndqAb1Ec3Ma9Wu8TfNaxBULBvZg8bMobZCjLcoUFQzJZ8OffgEYMqHM19tYBH5HozjqUJey67Giqfs6cP6ldKaZDcmuGKVKRG2owzGUbICBA93e7kvxh00w9FszwdwZzwg1MLX6uJ0IuSwjQW4vmSFXSaS1neD6HDPTUoCocbIQ5f/sjVdjVNvuuvL0g0ecxI6+btw6CoNXj2TxsoMnEEXv0Vj10NrDP98T2gzJ/WyRKIEppXrFTF0sUWlyGAU4efIJ++bJ/
x-ms-exchange-transport-forked: True
Content-ID: <1C3EF7088AABC144A8644FCD98156D2A@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0044e479-2469-4be2-7c77-08d802c61824
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 05:15:10.3080 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XwGwClpBgPebdoYPbQRBbfSZVA8DXAJDathNhFkNbmOIXNCOppqZndANChhf/qMhkLG0ys4Joux9IUQ94/mXRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0729
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04S5FKN2006589
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 15/15] dm-zoned: prefer full zones for reclaim
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

On Thu, 2020-05-28 at 13:16 +0900, Damien Le Moal wrote:
> On Wed, 2020-05-27 at 08:22 +0200, Hannes Reinecke wrote:
> > Prefer full zones when selecting the next zone for reclaim.
> > 
> > Signed-off-by: Hannes Reinecke <hare@suse.de>
> > ---
> >  drivers/md/dm-zoned-metadata.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> > index b89b3d3b9ec9..f161ef4e3d3d 100644
> > --- a/drivers/md/dm-zoned-metadata.c
> > +++ b/drivers/md/dm-zoned-metadata.c
> > @@ -1936,7 +1936,7 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
> >  						    unsigned int idx, bool idle)
> >  {
> >  	struct dm_zone *dzone = NULL;
> > -	struct dm_zone *zone;
> > +	struct dm_zone *zone, *last = NULL;
> >  	struct list_head *zone_list;
> >  
> >  	/* If we have cache zones select from the cache zone list */
> > @@ -1953,6 +1953,13 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
> >  			dzone = zone->bzone;
> >  			if (dzone->dev->dev_idx != idx)
> >  				continue;
> > +			if (!last) {
> > +				last = dzone;
> > +				continue;
> > +			}
> > +			if (last->weight < dzone->weight)
> > +				continue;
> > +			dzone = last;
> >  		} else
> >  			dzone = zone;
> >  		if (dmz_lock_zone_reclaim(dzone))
> 
> If all random/cache zones are used but none of them satisfy the
> condition last->weight < dzone->weight, we may end up starving reclaim
> and having user IOs accessing a new chunk wait a loooong time, if not
> forever, No ? I agree that aiming at reclaim of full zones first is
> more efficient, but we need a fallback to ensure forward progress.

Ignore... You are simply trying to select the zone with the largest
weight, which makes perfect sense. The commit message mentioning "full"
zones tricked me... Arg. I need more coffee. Slow afternoon :)

Renaming "last" to "max" would make the intent clearer I think.

Anyway, please feel free to add:

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

