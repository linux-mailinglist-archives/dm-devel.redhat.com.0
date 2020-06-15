Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2501FA425
	for <lists+dm-devel@lfdr.de>; Tue, 16 Jun 2020 01:33:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592264006;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=RsyBkCG02HQfydoUJhZxYYAcpPwDzpfkBpAqECqlc6k=;
	b=Jir9caDHked9MgH0BEpeJ2XK7RPn2C/OGysLEqoZcf/ov4iERCULO+Qg/lbWQ1VxDfG1WN
	zRW7tha9HVMYsop0XTg0pZuXiNYqNXmBLKLJbfwFYs6fh4Dy4H779/OMqci1gI9cAbFW9u
	iMgozGgLkiXlflS0ifdbztNJJBp2Tn8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-54VQl-E6NjSdYI0EdE86Bw-1; Mon, 15 Jun 2020 19:33:14 -0400
X-MC-Unique: 54VQl-E6NjSdYI0EdE86Bw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C604ABFC6;
	Mon, 15 Jun 2020 23:33:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8A82768DC;
	Mon, 15 Jun 2020 23:33:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F67A1809547;
	Mon, 15 Jun 2020 23:32:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05FNWXYu013234 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 15 Jun 2020 19:32:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5F1DA7D4E7; Mon, 15 Jun 2020 23:32:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59BEB5EDEC
	for <dm-devel@redhat.com>; Mon, 15 Jun 2020 23:32:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C9E1800655
	for <dm-devel@redhat.com>; Mon, 15 Jun 2020 23:32:31 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-377-3iRwiL4dNtiX0hnABMgX6Q-1; Mon, 15 Jun 2020 19:32:27 -0400
X-MC-Unique: 3iRwiL4dNtiX0hnABMgX6Q-1
IronPort-SDR: lcKQnAxO0EawTSzSRUb+GnaliIw0iyfdTr2ioqmsE7s/gznd5o0u8q+AoKRnEcEOpCDpgQY0wW
	xta7C8sDyqsu1JHfdkK7FvVj+HThRH2ukD7hWIuslXw5GxTWcUanNDIcL/zAEEC+ph2dOpOr0H
	dmm65n/xpQ2vfhruDzN2a9OOgF2uwQ9nLUNZ5gL6ba34zxrmeARwbzaE+VV65gG5cnBb008gwY
	beikft8iXcSCEIXHlv640eQaTSxocb48gHGXpg5q347JsZIajTL84Ls6DDdx1ET4+hUdZicPNP
	YOs=
X-IronPort-AV: E=Sophos;i="5.73,516,1583164800"; d="scan'208";a="140341419"
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
	by ob1.hgst.iphmx.com with ESMTP; 16 Jun 2020 07:32:26 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0376.namprd04.prod.outlook.com (2603:10b6:903:be::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.24;
	Mon, 15 Jun 2020 23:32:22 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3088.028;
	Mon, 15 Jun 2020 23:32:22 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hou Tao <houtao1@huawei.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Thread-Topic: [PATCH] dm zoned: assign max_io_len correctly
Thread-Index: AQHWQsTBfMO/4mnSWECFnkC/veciiw==
Date: Mon, 15 Jun 2020 23:32:22 +0000
Message-ID: <CY4PR04MB37518EFBA09A7E08C48E97EFE79C0@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200615033323.146312-1-houtao1@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b648d7e2-978b-4a9b-520c-08d811845aa9
x-ms-traffictypediagnostic: CY4PR04MB0376:
x-microsoft-antispam-prvs: <CY4PR04MB0376D021358196436C603F01E79C0@CY4PR04MB0376.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:454;
x-forefront-prvs: 04359FAD81
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fXlIEK3uo7XmYhlUzN9EzSczk77qCARVKIh0Pi1vbohMkte3NJcvqs4G/40iQCABpzMp0yllkHM5QsAq4yHQR15O8zBoLW+ZOcO41bcFLiyDp1J3O5e9lXADd2VnxpEI3c+ltV4zm0nb3A5vsBKMdBRcOKcaiYUK+Bj12i1Oxvco2TT2bOS1tmlU+eP30fL4+f3ztV5aLIbpLJFy4z38iEqrpnRRUXitgM0K4Lusuv2fJZyLtyToDOXcvHlD1sDuPlsS5aZnpYG+wPX4GtUHS0nJ0DeDh2xcxP43gKGkWQypwv8rJ7Z4RCsDTqcfszm9J+xjzf4KY+BRmcnS1HmS1w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(76116006)(83380400001)(110136005)(7696005)(66946007)(2906002)(71200400001)(8676002)(91956017)(66476007)(64756008)(66556008)(54906003)(8936002)(52536014)(66446008)(4326008)(9686003)(55016002)(33656002)(86362001)(53546011)(6506007)(186003)(478600001)(316002)(26005)(4744005)(5660300002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: d1NQz2C3iWwXVrqpfh/JhhmvOYEf0VUeWILoe5mMNDLypPJ0L1alds/kh17L5mDPKr4yErq7f12z8MLlBEiOyz8zaUK3xDN046qXhKTdxJfPRiwOfDF2MANZ3ucC2lno/eJUgEJh8NlLWvE5l8u2eJ3baU1zWZngIG7JETJz+oIi3OAX7acpcbydTkS0iONy9V8kQMKJ3qo9vKF74jSj+++iJMfxv4bmdMylI7it0OgggQ65TJk0GSJhmJvhtTyycBct22pYEkSNJ90YGu6BvOycLd3zjDJ2Bj6mx8absQeRkBJ4npXc6lG7bQEjGNeeIRc7f4ngV/E5Hpol2GObvGto9TQGkTWfxu8De5g3JmsxMdT1ptMZfNTuwNiVkvuNGww1xbNIlPrWxlfwSSEJKkj3ZANsEmaA4yNq3NgN4aS0JzAyYeASj2Pzb7zR7snsvlNWoHZi5cEXoLFghQA5rIg/4pwqBXU3C6D0qdB6HNc=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b648d7e2-978b-4a9b-520c-08d811845aa9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2020 23:32:22.6107 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XG5utIMbWyY9XISyZY8FxnXSrayvlgontJKNhormHTTsJhdsZRrz/mJ9O7JV/eTo6FvJdibBOJ5GoWIBkKevAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0376
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05FNWXYu013234
X-loop: dm-devel@redhat.com
Cc: Hannes Reinecke <hare@suse.com>, Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>, Bart Van Assche <bvanassche@acm.org>
Subject: Re: [dm-devel] [PATCH] dm zoned: assign max_io_len correctly
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

On 2020/06/15 12:26, Hou Tao wrote:
> The unit of max_io_len is sector instead of byte (spotted through
> code review), so fix it.
> 
> Fixes: 3b1a94c88b79 ("dm zoned: drive-managed zoned block device target")
> Signed-off-by: Hou Tao <houtao1@huawei.com>
> ---
>  drivers/md/dm-zoned-target.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index a907a9446c0b..cf915009c306 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -890,7 +890,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	}
>  
>  	/* Set target (no write same support) */
> -	ti->max_io_len = dmz_zone_nr_sectors(dmz->metadata) << 9;
> +	ti->max_io_len = dmz_zone_nr_sectors(dmz->metadata);
>  	ti->num_flush_bios = 1;
>  	ti->num_discard_bios = 1;
>  	ti->num_write_zeroes_bios = 1;
> 

Good catch !

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

