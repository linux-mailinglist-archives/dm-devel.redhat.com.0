Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8F124F0DE
	for <lists+dm-devel@lfdr.de>; Mon, 24 Aug 2020 03:16:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-YSpsPpyuOqC8_3qOQRDesA-1; Sun, 23 Aug 2020 21:16:32 -0400
X-MC-Unique: YSpsPpyuOqC8_3qOQRDesA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 266CA8030D6;
	Mon, 24 Aug 2020 01:16:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CB67100AE5C;
	Mon, 24 Aug 2020 01:16:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E893418408A0;
	Mon, 24 Aug 2020 01:16:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07O1Fomi017141 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 23 Aug 2020 21:15:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E62804401D; Mon, 24 Aug 2020 01:15:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E038844024
	for <dm-devel@redhat.com>; Mon, 24 Aug 2020 01:15:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E06598007A4
	for <dm-devel@redhat.com>; Mon, 24 Aug 2020 01:15:46 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-414-G1cNuzhYOcGFfZ2T-B_6kA-1; Sun, 23 Aug 2020 21:15:44 -0400
X-MC-Unique: G1cNuzhYOcGFfZ2T-B_6kA-1
IronPort-SDR: I7jn5yaovnnujm2kbbTrzGff6CFxz8AVkxsgwzeEnLAz7/x1zBsQZaW78wcuRsjKVtcOWjL0yM
	hHx5Qe73jlznZHQKTMsaHzqQp1cIJVJJntAStaEnajexbpI3ECKNSKN/gPM4VvU1URXK+cM6UK
	s7t4uNn2UaqsA9NbRg/j5r6m/rDzYQONadTGRemlbRlHVOxzCe45jEsdSLhLHFTDOLO8ZcZvH7
	8Tv3cWshFbOS9N9tP9b0EVlZHUwV9lgCM6MMpWOdLzIJinmdBVBnAKxsSKelc25cW7SEb2AjvD
	51Y=
X-IronPort-AV: E=Sophos;i="5.76,346,1592841600"; d="scan'208";a="255117624"
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
	NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
	by ob1.hgst.iphmx.com with ESMTP; 24 Aug 2020 09:15:42 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB1113.namprd04.prod.outlook.com (2603:10b6:903:b9::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24;
	Mon, 24 Aug 2020 01:15:41 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::7d15:9936:4b3b:f8a2]) by
	CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::7d15:9936:4b3b:f8a2%12]) with mapi id 15.20.3305.026;
	Mon, 24 Aug 2020 01:15:41 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Milan Broz <gmazyland@gmail.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>
Thread-Topic: [dm-devel] [PATCH] dm-crypt: Document new no_workqueue flags.
Thread-Index: AQHWdxnReki39hSSZEyiwqHvXiM9yA==
Date: Mon, 24 Aug 2020 01:15:41 +0000
Message-ID: <CY4PR04MB37518F3475AE21AB020B628DE7560@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200820174538.20837-1-gmazyland@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ba9ec434-653d-4e5a-58e4-08d847cb3827
x-ms-traffictypediagnostic: CY4PR04MB1113:
x-microsoft-antispam-prvs: <CY4PR04MB11132CDCF786C3924F12FC74E7560@CY4PR04MB1113.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: waac5m7qPrXiY9VKkusOZUL5IBxgtWPV2bcvk4DTDMfhSL+//XhQNUcbFMGdXIzW72s2Zm5rxyFPrI84H6m6bZ1nu9YTVbUJ4nnAA5n2p/k0vl4wWbYwnLOO757hqHOlCIELOnfRLmAfDmL+EIDx6+YRYhmhXbAiczU04pjY7ne7oDOv5doHwiR5tWrXVC+SORN9yvWHh8XG1c6i4tzMH1r8SeJp+wCY2zSTaenvZt17MqSYKllrklvHPh13JWjFXuDwwB6qaP1syiZUr1RBK8MVF0rVM+ITDBHeR7TlBX28KNjRMls8McQp43VVZ7TDcy5inMm7bX5mzFCybiII3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(110136005)(5660300002)(66556008)(53546011)(6506007)(55016002)(7696005)(64756008)(66476007)(186003)(71200400001)(26005)(66446008)(316002)(9686003)(52536014)(66946007)(91956017)(76116006)(478600001)(2906002)(8676002)(33656002)(8936002)(86362001)(83380400001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: X9a1L1JG5/dmHic8uTf4Okg+WRfUW5tCd52aG26taO9kcdq02mrSbx4D3Ray1MuVqHr2YstFxcuySdfK9CEpU97Nb/oFyxy1qy3VaPCFbGJ9BjZlHnVStve9d3AsRivVrQvNOZp3kXxzlK0PNPeulcb1wejpJN2wNLdNzFKZ62Mq5NMxwI8JHxuK51lSvZGvfcVyCr7erVSMp5UPhqPTt/bl3s9BQW1axJIqQ60gmr0EadvkphqwFHjISSTMJ+BO7kjaWOk8WzIkq9AQiBcGdNzv5RblJ2JP4eOpP1vZBbgr9CaboitFNlJOoCcHkYf2nvV54VjqdZwmpqdITmiFD2tAA7aevAZfL4bsUEOX17QHaGsF7savVYSi5Ki+bjKECWsAy7H9dkhtUGOourq4vQpvl0yPeL2/K4H/bJgbSH+uSxa1hqol3jEsN78bA2UEbDeubdJTGihUgKAyUXryuDAmYt9DV3QgoqqS2KmZ3MNGyoYkGyK5oWL/QnRYB9SNjUID7k9r8TtvZbc6mfI+aryw9f7wILJq7tMzqPSveTkywLhlisv8nCvOZTAzvXMpsVlWC4nRVmh19k1cof/CZTPfJygqdeutofixOpMiZpCd8b9NraBuGORVb5NcwuJsRdKvgL9Cw2Z6EZc5GXCAZA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9ec434-653d-4e5a-58e4-08d847cb3827
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 01:15:41.8711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T6sgGMYFhy0oUCPB3TqRiLXUvmcuswFCgvZ/jqGKDg2ztgDrBeSzjNKhV/1DVGmFwirA3FtxgS+uEJPhwCQu8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1113
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07O1Fomi017141
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm-crypt: Document new no_workqueue flags.
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/08/21 2:46, Milan Broz wrote:
> Patch 39d42fa96ba1b7d2544db3f8ed5da8fb0d5cb877 introduced new
> dm-crypt no_read_workqueue and no_write_workqueue flags.
> 
> This patch adds documentation to admin guide for them.
> 
> Signed-off-by: Milan Broz <gmazyland@gmail.com>
> ---
>  Documentation/admin-guide/device-mapper/dm-crypt.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/admin-guide/device-mapper/dm-crypt.rst b/Documentation/admin-guide/device-mapper/dm-crypt.rst
> index 8f4a3f889d43..94466921415d 100644
> --- a/Documentation/admin-guide/device-mapper/dm-crypt.rst
> +++ b/Documentation/admin-guide/device-mapper/dm-crypt.rst
> @@ -121,6 +121,12 @@ submit_from_crypt_cpus
>      thread because it benefits CFQ to have writes submitted using the
>      same context.
>  
> +no_read_workqueue
> +    Bypass dm-crypt internal workqueue and process read requests synchronously.
> +
> +no_write_workqueue
> +    Bypass dm-crypt internal workqueue and process write requests synchronously.

Could you add one more line here saying something like:

This option is automatically enabled for host-managed zoned block devices (e.g.
host-managed SMR hard-disks).

Thanks !

> +
>  integrity:<bytes>:<type>
>      The device requires additional <bytes> metadata per-sector stored
>      in per-bio integrity structure. This metadata must by provided
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

