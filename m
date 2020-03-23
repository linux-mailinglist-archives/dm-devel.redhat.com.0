Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id D0F9E18EE07
	for <lists+dm-devel@lfdr.de>; Mon, 23 Mar 2020 03:37:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584931030;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ycKESfF6QjQ2bpTPmCi/C6syPPnnyLMSoHaLuBQtUTg=;
	b=gNGOAwspcd5CfMRZt8NouVahpwYwL++WAwdhgKo9WmGLlW2gI9dXAB0fZMtNY3Ain6VyCm
	2nCy5uvExKMRomd26BzIHFExdHGgRcGSdOTWIAGSMUEL0so/osXoubV/TMNoaH8YcZayLI
	dox4nr8xSd9d3cypz/06O54Ss63J4XU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-SrXL7E6rNMixGgYS97GW8g-1; Sun, 22 Mar 2020 22:37:08 -0400
X-MC-Unique: SrXL7E6rNMixGgYS97GW8g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D010107ACC7;
	Mon, 23 Mar 2020 02:37:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 856DD5C1B5;
	Mon, 23 Mar 2020 02:36:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F3F9863B1;
	Mon, 23 Mar 2020 02:36:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02N2YSeh001679 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 22 Mar 2020 22:34:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BE040DBF2F; Mon, 23 Mar 2020 02:34:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B85BEF8A02
	for <dm-devel@redhat.com>; Mon, 23 Mar 2020 02:34:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B16A8F6913
	for <dm-devel@redhat.com>; Mon, 23 Mar 2020 02:34:26 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-201-kaRE75fSPSK08pSnRkPYUg-1; Sun, 22 Mar 2020 22:34:23 -0400
X-MC-Unique: kaRE75fSPSK08pSnRkPYUg-1
IronPort-SDR: +sEcCa0R3gEV/cR3vPL1ztWwlT1zHjK9hxubctSl+RS5XvQLhCpiNObyJ4pc+qcDiL3098Xl0Y
	CneapcmYW2svYvTbZjfJkyHG6gkohd405lN9GIgZJcX+Y0vLz0qGAetExMiG6gPurkXKGjldCs
	lUr+Pgni6gB27RUznfcSyAmz+KQCaW6cmzRcNl//4QDnOC6muc1+pmtXJEI6tIlEllX1S9ybDT
	ccI4unZYFcUqQIaxKBrxu1DgNwGp9SdABYTkFh7KNyxMG4cXax8/XhMqyrVH98M/wV5WMbTdYl
	NpI=
X-IronPort-AV: E=Sophos;i="5.72,294,1580745600"; d="scan'208";a="133654320"
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
	NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
	by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2020 10:34:22 +0800
Received: from CO2PR04MB2343.namprd04.prod.outlook.com (2603:10b6:102:12::9)
	by CO2PR04MB2344.namprd04.prod.outlook.com (2603:10b6:100:1::6) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20;
	Mon, 23 Mar 2020 02:34:18 +0000
Received: from CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b]) by CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b%7]) with mapi id 15.20.2835.021;
	Mon, 23 Mar 2020 02:34:18 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Thread-Topic: [PATCH] dm zoned: remove duplicated nr_rnd_zones increasement
Thread-Index: AQHWACx4CVTkHZ3jTEqS7u0EG8fLcg==
Date: Mon, 23 Mar 2020 02:34:17 +0000
Message-ID: <CO2PR04MB2343196CAA8DAC40192E0A1AE7F00@CO2PR04MB2343.namprd04.prod.outlook.com>
References: <20200322092912.23148-1-bob.liu@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5cad68d5-04b6-4333-21d4-08d7ced2afa0
x-ms-traffictypediagnostic: CO2PR04MB2344:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO2PR04MB23442466D206753A7CE7BC5FE7F00@CO2PR04MB2344.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:392;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(199004)(186003)(26005)(53546011)(6506007)(66446008)(64756008)(66556008)(5660300002)(478600001)(66476007)(76116006)(91956017)(52536014)(33656002)(66946007)(71200400001)(8676002)(8936002)(81166006)(81156014)(2906002)(9686003)(316002)(86362001)(4326008)(54906003)(110136005)(7696005)(55016002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CO2PR04MB2344;
	H:CO2PR04MB2343.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SXPO4ELUn/cvzo903xErnGjb3yqK9U13TMOMAJjw0kvBQQYKm294r3y9SgLNetk55+l/gZhWoFzb0aKPAFnR3LL8WWpL98AnKnyjW45bvp9DE7tlbJl/75o1uzxbgWOmhJrBIHfcuM9rgtOrkqps4ntaY1emqKoKw7KUZSwEO50dPPOH6ItkpyhQH44a9N6dtVOEZdR7RxTMD9/4k8U7dgF6dE5IPoNV3THZDkZT3a2jbuX757ca5+3RrtxUbBlVm+89Uo25zwTBGWKaF2KjvGdhC6bYeBAp1k59nmDBlGzfXa0mH3Zj84KwYqfJi6ltgcsBkYTbdW0lsNAVqIwZu5AB0evAgo+OAc0ZGaeJ/eaCU2LzldEyclizl2L4R/WGy9M0AZ7DIqjn5FmNUE2p7tj20GfZDp8BDKUqEIcyKMNMT1bkslqmue/ERLMU6/94
x-ms-exchange-antispam-messagedata: d+mwhnN7SvFVCkY30Kzytcrgchg/v/ivg7BJakCGVnBL0aRasnldn0PA/a7UL/Xu1is/ehmpGNp1O19Dw5rEnoWk5kFHP8dovZgnzuVNbgutf3B/bpWK3e/J+W35Rntb48G9BSNyxiaIL992oTDb5w==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cad68d5-04b6-4333-21d4-08d7ced2afa0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 02:34:17.9696 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wck0Pjzee3JgL7CUQCUI+E7WoMMtcd+hI8q+OOsZ/I4G+VUFIbQb8SloOiAylMgRjE9nhzdpuUk9bKNyIZ7ZFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2344
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02N2YSeh001679
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Fomichev <Dmitry.Fomichev@wdc.com>, Dmitry
Subject: Re: [dm-devel] [PATCH] dm zoned: remove duplicated nr_rnd_zones
	increasement
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

On 2020/03/22 18:30, Bob Liu wrote:
> zmd->nr_rnd_zones was increased twice by mistake.
> The other place:
> 1131                 zmd->nr_useable_zones++;
> 1132                 if (dmz_is_rnd(zone)) {
> 1133                         zmd->nr_rnd_zones++;
> 					^^^
> 
> Signed-off-by: Bob Liu <bob.liu@oracle.com>

Good catch ! But you need to add a Fixes tag and CC stable.

    Fixes: 3b1a94c88b79 ("dm zoned: drive-managed zoned block device target")
    Cc: stable@vger.kernel.org

Other than that, looks good.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

> ---
>  drivers/md/dm-zoned-metadata.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 516c7b6..369de15 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -1109,7 +1109,6 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int idx, void *data)
>  	switch (blkz->type) {
>  	case BLK_ZONE_TYPE_CONVENTIONAL:
>  		set_bit(DMZ_RND, &zone->flags);
> -		zmd->nr_rnd_zones++;
>  		break;
>  	case BLK_ZONE_TYPE_SEQWRITE_REQ:
>  	case BLK_ZONE_TYPE_SEQWRITE_PREF:
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

