Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 186BD1DE140
	for <lists+dm-devel@lfdr.de>; Fri, 22 May 2020 09:47:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590133621;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=gXsl6ijUhKhya6TKkhI8nIvx366CkweMBo/Hqx8kc+Q=;
	b=Mas6eeB7Jy55V4oh1rmXABGXc0jPIUq4o1+u65D7CEkTKWj43f7SjM3PPEbG1F8HwXZvxD
	AMM8zpkioQV3hgekDrCl5pyU/1Pqgom7UkES59j00mbYZGcUbiYMgyYW/hnAtOSz/xlTeg
	uMdEZXQbFx1CFdqJIENMdDwm5U76lTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-rFCSoEgGNXao5BVkyz_EIQ-1; Fri, 22 May 2020 03:46:58 -0400
X-MC-Unique: rFCSoEgGNXao5BVkyz_EIQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFACC1005512;
	Fri, 22 May 2020 07:46:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 29FDC648D7;
	Fri, 22 May 2020 07:46:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 52E2C4ED33;
	Fri, 22 May 2020 07:46:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04M7jrox009870 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 May 2020 03:45:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E64E710BC2B6; Fri, 22 May 2020 07:45:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B577910BC2A8
	for <dm-devel@redhat.com>; Fri, 22 May 2020 07:45:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF6288007C8
	for <dm-devel@redhat.com>; Fri, 22 May 2020 07:45:49 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-18-STfYPL_xPlOHNf-kW6wVLA-1; Fri, 22 May 2020 03:45:47 -0400
X-MC-Unique: STfYPL_xPlOHNf-kW6wVLA-1
IronPort-SDR: p4KvgZ8v2Hp6gvWCehLghngKNpjHZt4sXmsCUF73F8yuN92uued3GP+WEn297ky2xtZjdX+NzL
	MFGFJoPBj8xGZdUoZ4FZCX03aH2YbDR1GijWAuvYpAo9tLPmytsb08JfPUvL9Noqh/maL1xWwf
	oXfEs6DMqaQ5oXcFqXiITTlAwLhM9c6WtHP50xRFo0005GyqSanPBzB/Ocyp5tTyfruiDk8EDV
	9BWOnmDZJ54mCQb3PVZ2/4sFsQedJw4uVr66OYew0GUOZJ3Wa+0Tp3CfyGzZ9QiGnJ9H8x9/dV
	bdU=
X-IronPort-AV: E=Sophos;i="5.73,420,1583164800"; d="scan'208";a="138299246"
Received: from mail-bn3nam04lp2059.outbound.protection.outlook.com (HELO
	NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.59])
	by ob1.hgst.iphmx.com with ESMTP; 22 May 2020 15:45:45 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6391.namprd04.prod.outlook.com (2603:10b6:a03:1e9::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24;
	Fri, 22 May 2020 07:45:43 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%5]) with mapi id 15.20.3021.020;
	Fri, 22 May 2020 07:45:41 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH] dm-zoned: remove leftover hunk for switching to
	sequential zones
Thread-Index: AQHWMAse9oWhu8JJmEKY9a74gx7odg==
Date: Fri, 22 May 2020 07:45:41 +0000
Message-ID: <BY5PR04MB6900CDDFAD24878D00D951E0E7B40@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200522073209.78681-1-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ec48d895-3c3c-4460-0329-08d7fe2420be
x-ms-traffictypediagnostic: BY5PR04MB6391:
x-microsoft-antispam-prvs: <BY5PR04MB6391CE393D0D045F8BA7050CE7B40@BY5PR04MB6391.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:269;
x-forefront-prvs: 04111BAC64
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nkS758rcXluLQJWE8x/K4lTLmM8VKMrLDdYEcqfbQmlEzSyklAK4hHsvqf7Mh6bJ8cE23azkZq5kos8twF2XAUOe+XRxUTnfi+m0vq9xezD6QEPgDr6VPtDb9zvGqljSbp/EackL7rVn2XnFI571gaMp7Joq9C8uPIj4u1Vj0vmwPMU9kkcoX69UB7XaZyi0tDM7qQSG9HhZv56WE0Df4tjxUyy/8gxwY6Qt6Kr+H8tCnNPvYwTcho35XOkOx5QISjcXJXFqSulLxEalXD+KWvj88kkM2uWy9R4CNWybBicKxtN7cztRnePj54NbI6UiB9n5vvFEHYISp32DHvaZOg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(86362001)(8936002)(33656002)(8676002)(316002)(110136005)(7696005)(53546011)(5660300002)(26005)(6506007)(54906003)(186003)(71200400001)(52536014)(2906002)(66556008)(66476007)(76116006)(64756008)(66946007)(4326008)(9686003)(66446008)(55016002)(478600001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: jw6q1dJHIpWjIH2eLprhBjaU8UTjev2ZvJaxZN4rd55Lw1jq3shGxxF09pX2YtU5trGMLHGCv0gE+bd59ItOZfs4tCBd0jcFUpgf7A83x2IeHf/fhWIDXvjQvR1VH4B2C+S7Q1BkvP3AhCjdAfwpy8FY4b3bn/gzVL/Ytzd3UBq+rKJAliIXgUNuQ63/EBnCk+TXLCv0UNQn9k8PzFceoalS/6Fsv5WrJe0Fg2P+4wk7dQ5eNelngDNe8Mij5GG35lusWP/dxxnNBFWvdO1A2TXJWGTxaUq2IdZPt8+i/1kgsAKxLDD5AyLw80U0GX97I5gIZRg1+fCyGfGg3+6YEKubuNeG40ZgRu+Bj95M0idFaDtlhc96mighRTu9iRlm2xpT2z+Jk/hvfvMyYnxfgR+yeGqE9eAsvcv4yIViEOcvWCjQS26freoR+2r+uMtJLyX7L9Y0mdQFnlu5vN6dGBZwoQPY1gA0Kq90SVMQV24OE5ObGHflZ1wxW68zlmvR
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec48d895-3c3c-4460-0329-08d7fe2420be
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2020 07:45:41.6889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e1e1ze6COzZ2T95nNINAVuziC4fhvPVRXQuYpR47LAPfvaa3MFgazBnG8SM2D07wY3Q6pQuCMoimEh1lRuZI1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6391
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04M7jrox009870
X-loop: dm-devel@redhat.com
Cc: "Hannes@suse.de" <Hannes@suse.de>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm-zoned: remove leftover hunk for switching
 to sequential zones
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

On 2020/05/22 16:32, Hannes Reinecke wrote:
> Remove a leftover hunk to switch from sequential zones to random

...from random zones to sequential zones...

> zones when selecting a reclaim zone; the logic has moved into the
> caller and this patch is now pointless.

s/this patch/this hunk/ ?

> 
> Fixes: 34f5affd04c4 ("dm zoned: separate random and cache zones")
> Signed-off-by: Hannes Reinecke <hare@suse.de.
> ---
>  drivers/md/dm-zoned-metadata.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index db0dc2b5d44d..4a2e351365c5 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -2111,14 +2111,6 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
>  		 */
>  		if (!(flags & DMZ_ALLOC_RECLAIM))
>  			return NULL;
> -		/*
> -		 * Use sequential write zones if we started off with random
> -		 * zones and the list is empty
> -		 */
> -		if (list == &zmd->unmap_rnd_list) {
> -			list = &zmd->unmap_seq_list;
> -			goto again;
> -		}
>  		/*
>  		 * Fallback to the reserved sequential zones
>  		 */

Apart from the commit message nits, looks good.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

