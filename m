Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 40A7D1E966A
	for <lists+dm-devel@lfdr.de>; Sun, 31 May 2020 10:55:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590915342;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=te3WqM40H63ic36jk7OW5Dl+Q8I5Lfaf3vEf33gAQ/E=;
	b=WUra/hHJcTLcPYVbVlnjqp605uvjmNWyoXfThyBlTYnSX+Z60VbXQZ635TOGmcny1SvwM5
	tbAMlSYcef0WWw43j0tW9+BJeK+Qb8rSXkvztlIzU8fFEzGWeU0JEQ2WAwQ8Ve+ZsRptwP
	JYhwl9PzjWbaJfO+ASo/tpoK6jA62UA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-MblJCRdyOsqSvnJijGC9_Q-1; Sun, 31 May 2020 04:55:39 -0400
X-MC-Unique: MblJCRdyOsqSvnJijGC9_Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 516D98015CE;
	Sun, 31 May 2020 08:55:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE9B45D9C5;
	Sun, 31 May 2020 08:55:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 66AEC1809543;
	Sun, 31 May 2020 08:55:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04V8spIk030303 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 31 May 2020 04:54:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1A6B62026972; Sun, 31 May 2020 08:54:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1585A202696B
	for <dm-devel@redhat.com>; Sun, 31 May 2020 08:54:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B04718007A4
	for <dm-devel@redhat.com>; Sun, 31 May 2020 08:54:48 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-47--Use3MmnNIqCboXTDuMGxA-1; Sun, 31 May 2020 04:54:44 -0400
X-MC-Unique: -Use3MmnNIqCboXTDuMGxA-1
IronPort-SDR: Wl3kkFb0IXCEHR9Uel6Dx4MmB3wXOcBh35wiCh9Hog8/pzMdQnfmvt2HQNEhNxMSeEpYYnViTW
	aqoUHD8qMak0Cm2gKvNttb+FHTbocN5h6aZJiz9rnUZkXLwLMuzAm255GnE/VqvMXXDBUCLguV
	ne1KX2WaeNyDR5lavvI1TPl/GMUI5QZvkz67NuM5jRMGhC1Mu2Zx5a1m4b+1YlsFH8cg0Ex+6u
	dyelfiMS5vufp3tHjr7ylSzGNRluZu3AJBnaOkosmCe1DrpVfJPsILz7R4l4af5pw8Jp1WcYFT
	aYQ=
X-IronPort-AV: E=Sophos;i="5.73,456,1583164800"; d="scan'208";a="140301695"
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
	NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
	by ob1.hgst.iphmx.com with ESMTP; 31 May 2020 16:54:42 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0871.namprd04.prod.outlook.com (2603:10b6:910:56::24)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19;
	Sun, 31 May 2020 08:54:41 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3045.022;
	Sun, 31 May 2020 08:54:40 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "snitzer@redhat.com" <snitzer@redhat.com>, "hare@suse.de" <hare@suse.de>
Thread-Topic: [PATCH 13/15] dm-zoned: allocate zone by device index
Thread-Index: AQHWM+89YyBYJBoKJUKbmDE8V/aNnqi841YAgAJWCgCAArD9gA==
Date: Sun, 31 May 2020 08:54:40 +0000
Message-ID: <53b683b85375e5827dc98c54da4b131acbbbad49.camel@wdc.com>
References: <20200527062225.72849-1-hare@suse.de>
	<20200527062225.72849-14-hare@suse.de>
	<f38d9c9802239e3021b602af8c178428d72e791b.camel@wdc.com>
	<2966c1c2-86e9-2be3-09b8-3ab7cdb29d6a@suse.de>
In-Reply-To: <2966c1c2-86e9-2be3-09b8-3ab7cdb29d6a@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 (3.36.2-1.fc32)
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b8ab9261-2d56-4005-4287-08d80540419c
x-ms-traffictypediagnostic: CY4PR04MB0871:
x-microsoft-antispam-prvs: <CY4PR04MB0871CD0065BFECFD3D7B40EFE78D0@CY4PR04MB0871.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:538;
x-forefront-prvs: 0420213CCD
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lu9OteK0QzsB6dXgizrNEEttoCbgZoDtWF3Uq7lb6ASjYIlGEiCZHFf51KoGNOaYgNIkp6ug5XcRmgxsaokCA66ETozjecfx7/B8+eWJLS60hCQCe2a5fuCPZ4jczVD2QkoatRnVakQfpq9AQxLSpN5TQsZcx53GydM7n6scLksgCxh/QaK0hJhJxCwafPV18OQ0z8gwOa5Zf2V5Y6UOE7chE2cThhMn9/QZz3WVkmzG1n/Vqs7cRxkh0TJJsmgXehaedxbdwcLNJL4orqzgdQWNfr2TvzGPvy07d7q1/u0sjJPZiuYtGMDPQUU34B6i
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(186003)(478600001)(316002)(5660300002)(2906002)(83380400001)(6486002)(2616005)(110136005)(8936002)(71200400001)(6512007)(86362001)(36756003)(8676002)(4326008)(26005)(53546011)(66946007)(66556008)(6506007)(64756008)(66446008)(91956017)(66476007)(76116006);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: wCmz4szJ3jW78g3+SlfP5DsjcDcqeQcxHG80e8Vt/julTM110uTDs0yyCAv+3Ijyw/aKbWqjQlu06SkmIMk5R8jEltNt46gqrFf5KblaPW87IF/7b+lxjeFj6npEOSTdlmoraLWX4MoLjpsMRAabxvjf3ef7krlkMSjDEsTwwJvnY18OjEul92ue74CEsmnQri9pXvimzx/3oTyDZ2yeVIjFt0UJ1mSntaVoI0zJZ31YOjViydIR1v59FScuItzWjXvsY+fk2pnBjMqwcwlHll/BHAwgEbh9Qn3Tb4TzeawOZ4SCUasBT8R/tJnLeUyY72DBNZlAFT3BbVfqyY3IljGWfWU2QEY4yCn13S+/J92V2jVSamtNQ/GQG3AON5sZ4l+i4t7EZyHgKpRCZ8Ffa7EIZ2YOTlnX6DDcjeHAl5tnnAN1sxe9hx654ZLYdlxsGMZzIckgVZokUIlMl/TU9a5iFl6rHKVm2lKJ00VK77TR1VZn/qyP7UArpa1u8IIp
x-ms-exchange-transport-forked: True
Content-ID: <49EAB7312E50A849AE8AFDE04BE75B6C@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ab9261-2d56-4005-4287-08d80540419c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2020 08:54:40.9180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xjtRnjdyfJdzaSpBtLcjHJFlXiKGIBYCyB5hbUsQzXz0FTQchKDBiN63KFb+iw5GsflAT4xrGvZIjkcEcRreSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0871
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04V8spIk030303
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2020-05-29 at 17:48 +0200, Hannes Reinecke wrote:
> On 5/28/20 6:08 AM, Damien Le Moal wrote:
> > On Wed, 2020-05-27 at 08:22 +0200, Hannes Reinecke wrote:
> > > When allocating a zone we should pass in an indicator on which
> > > device the zone should be allocated; this increases performance
> > > for a multi-device setup as then reclaim can allocate zones on
> > > the device for which reclaim is running.
> > > 
> > > Signed-off-by: Hannes Reinecke <hare@suse.de>
> > > ---
> > >   drivers/md/dm-zoned-metadata.c | 17 +++++++++++------
> > >   drivers/md/dm-zoned-reclaim.c  |  3 ++-
> > >   drivers/md/dm-zoned.h          |  3 ++-
> > >   3 files changed, 15 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> > > index 689c1dd7ab20..0d65af94309a 100644
> > > --- a/drivers/md/dm-zoned-metadata.c
> > > +++ b/drivers/md/dm-zoned-metadata.c
> > > @@ -2045,7 +2045,7 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
> > >   			goto out;
> > >   
> > >   		/* Allocate a random zone */
> > > -		dzone = dmz_alloc_zone(zmd, alloc_flags);
> > > +		dzone = dmz_alloc_zone(zmd, 0, alloc_flags);
> > >   		if (!dzone) {
> > >   			if (dmz_dev_is_dying(zmd)) {
> > >   				dzone = ERR_PTR(-EIO);
> > > @@ -2151,7 +2151,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
> > >   		goto out;
> > >   
> > >   	/* Allocate a random zone */
> > > -	bzone = dmz_alloc_zone(zmd, alloc_flags);
> > > +	bzone = dmz_alloc_zone(zmd, 0, alloc_flags);
> > >   	if (!bzone) {
> > >   		if (dmz_dev_is_dying(zmd)) {
> > >   			bzone = ERR_PTR(-EIO);
> > > @@ -2182,11 +2182,12 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
> > >    * Get an unmapped (free) zone.
> > >    * This must be called with the mapping lock held.
> > >    */
> > > -struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
> > > +struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned int dev_idx,
> > > +			       unsigned long flags)
> > >   {
> > >   	struct list_head *list;
> > >   	struct dm_zone *zone;
> > > -	unsigned int dev_idx = 0;
> > > +	int i = 0;
> > >   
> > >   again:
> > >   	if (flags & DMZ_ALLOC_CACHE)
> > > @@ -2202,8 +2203,12 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
> > >   		 */
> > >   		if (!(flags & DMZ_ALLOC_RECLAIM))
> > >   			return NULL;
> > > -		if (dev_idx < zmd->nr_devs) {
> > > -			dev_idx++;
> > > +		/*
> > > +		 * Try to allocate from other devices
> > > +		 */
> > > +		if (i < zmd->nr_devs) {
> > > +			dev_idx = (dev_idx + 1) % zmd->nr_devs;
> > 
> > Hu ? You deleted dev_idx declaration above...
> > 
> It's now the function argument ...

Oops... Yes, missed that...

> 
> Cheers,
> 
> Hannes

-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

