Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 13E551E0486
	for <lists+dm-devel@lfdr.de>; Mon, 25 May 2020 03:55:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590371739;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=hrWQtSVRhLsoYmAnXMvGnz4hcyLVGtWkGqo+Zm2yRXI=;
	b=coPnLqmq6Xt2bo7/gjs2BSkFKJZx96Q1gW3ZxHcmyqiy8sfNhGFxnS77dj1o6A6Iyp59Aj
	1UqJgHBkLVxUdMu2kUwR/YbOs4ic6tQt4YrLBfhL3VrfKC1xNdStV+6s/X8x9ShRudliMn
	7UD2zgrIjULnFneuo93wst4pUTI03SE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-ZXJcJMY8N8ST7ZKqeEIf9w-1; Sun, 24 May 2020 21:55:36 -0400
X-MC-Unique: ZXJcJMY8N8ST7ZKqeEIf9w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11EBE8014D7;
	Mon, 25 May 2020 01:55:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCB8F83846;
	Mon, 25 May 2020 01:55:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 532AE54D29;
	Mon, 25 May 2020 01:55:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04P1sXI4030014 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 24 May 2020 21:54:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C07CF202683D; Mon, 25 May 2020 01:54:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A482420267F2
	for <dm-devel@redhat.com>; Mon, 25 May 2020 01:54:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 144078F3BAC
	for <dm-devel@redhat.com>; Mon, 25 May 2020 01:54:30 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-436-sShHwA1_OhuRrttHd4Tn6Q-1; Sun, 24 May 2020 21:54:24 -0400
X-MC-Unique: sShHwA1_OhuRrttHd4Tn6Q-1
IronPort-SDR: x+1IlJGG34sM9eqDP5pO/Yxfb9seN1Je+IZqkY72IHOMkzMiYGmBgbkBt6sIX3LR0g40c2xFiw
	RVqlT6Kv8pySF2y3fqeGmWqW8cDDBl0noABzlHpIGOpvQ57JcvzvvkCxNoN8utEKunFHCJ1eRw
	UcHgqJ9//z33ulXxyo2zBS3sQMJ0SNq6v+glD5aZe+MGipdVNsjqRy0bs44Ph6t04db4CF3RIH
	ttNYhstCQqabLHnsqgattTAUmiVGyJtS+E2TzMXivzLVmdytKQC5hkcre2VaqQ7mTlenU04tNZ
	mJQ=
X-IronPort-AV: E=Sophos;i="5.73,431,1583164800"; d="scan'208";a="241213757"
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
	NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
	by ob1.hgst.iphmx.com with ESMTP; 25 May 2020 09:54:34 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB1112.namprd04.prod.outlook.com (2603:10b6:903:b5::23)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27;
	Mon, 25 May 2020 01:54:19 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3021.029;
	Mon, 25 May 2020 01:54:19 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>
Thread-Topic: [PATCH 01/12] dm-zoned: add debugging message for reading
	superblocks
Thread-Index: AQHWME8lGOWMZgNJKkKQCP04oxrTEg==
Date: Mon, 25 May 2020 01:54:19 +0000
Message-ID: <CY4PR04MB3751A8221E6D35A3ECD0C216E7B30@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200522153901.133375-1-hare@suse.de>
	<20200522153901.133375-2-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c5638d9c-179e-4bca-8b3a-08d8004e89cc
x-ms-traffictypediagnostic: CY4PR04MB1112:
x-microsoft-antispam-prvs: <CY4PR04MB11126D8FAF0F75005CD300E4E7B30@CY4PR04MB1112.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:43;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TsJa6myN2FBuz7y1w2GEAV+zAl4J1hmnIdWFDpdEeeF/0mayZXYre6RMVKmX88KTh/2MASZq9XzkHQWNNd+tkM+d9G92hhO+HT1I922dwnJEfpY99C4MUDnSkoZkreE1ZNjNAOcyhJqaKc/hQ0/JAXVO2SRmzomb0AQBQvxLQJg8Q8Qsjh+bnbqFSB5TGgUViTAkJC5Un8mL7EOY4JAhNi3egI0rvMhY9p3a5fxQT/YHPfI3LfP8V53egTAbAbnG93tsq1LQdpMvpocw24+ERDYaASTZ5Y8Av68Oglgctl4sZMq385hOraFuXT5p5xCafQk9i+6Mtu+2uU7j7dNABQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(52536014)(66946007)(66476007)(478600001)(64756008)(66446008)(66556008)(53546011)(6506007)(91956017)(76116006)(5660300002)(9686003)(86362001)(186003)(2906002)(26005)(55016002)(316002)(8676002)(8936002)(33656002)(7696005)(4326008)(4744005)(71200400001)(6916009)(54906003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: wyyeYl7kW8HAeIz1xy9gx670yXKuGt0tAFGNyS3Q+/JIEbdw7b3oJD7wbuAG3UfxHQ7TwypPa2RUjMmuXU5mzLFLfZyveZficuTOfrGu+YICdQOg0uNBuoPV+W3G5/Q1/oBQkTrti/SDl+w5d9d+71Eb6iOQ4HhO+SNqQrS4myQYRwwkNmnBS7oyOZRQUD55VG+3tLX8h4kuYDPTwZU4jqohA3TCgEeKUlOgQGtbvpcF320IXeVshVNN8pS4jq1JDn8QHnhKOItJLrgYGFEossziWYmezz4nsR8el65l9v/a7tyBo3FUDGfLQzSpY1rszxjWV01uvb10b8+319TRB8DfyA//O0opFsfBAPlo5ClqbvwpfP1zoqeDqcfwxSlXID0HnS6WrZjwO/BS853Teqc2vMczPxLrUHADZqm20BzDGhs5yXAIhYVsma5LJcUN3sdBZEAiP4EytSyUlPL6WzenB9lQAjcmDd4Ipqeox4Q=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5638d9c-179e-4bca-8b3a-08d8004e89cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 01:54:19.1518 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Klun4nwM37DZLDnnQrc245/udZyXtRMUK1+li14EqiEY+MGzSoYvWwabLCQ+L4Knqhl/kOq+hexeNV8BKuD1nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1112
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04P1sXI4030014
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH 01/12] dm-zoned: add debugging message for
 reading superblocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/05/23 0:39, Hannes Reinecke wrote:
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 4a2e351365c5..b0d3ed4ac56a 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -1105,6 +1105,9 @@ static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
>   */
>  static int dmz_read_sb(struct dmz_metadata *zmd, unsigned int set)
>  {
> +	DMDEBUG("(%s): read superblock set %d dev %s block %llu",
> +		zmd->devname, set, zmd->sb[set].dev->name,
> +		zmd->sb[set].block);

A blank line here would be nice. Cosmetic only, no big deal.

>  	return dmz_rdwr_block(zmd->sb[set].dev, REQ_OP_READ,
>  			      zmd->sb[set].block, zmd->sb[set].mblk->page);
>  }
> 

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

