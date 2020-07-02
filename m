Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B41E5212795
	for <lists+dm-devel@lfdr.de>; Thu,  2 Jul 2020 17:17:55 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-huWy2hT4P2Ow4yl06lHkXQ-1; Thu, 02 Jul 2020 11:17:50 -0400
X-MC-Unique: huWy2hT4P2Ow4yl06lHkXQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 342C61083E86;
	Thu,  2 Jul 2020 15:17:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC8ED7789C;
	Thu,  2 Jul 2020 15:17:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 39D066C9C6;
	Thu,  2 Jul 2020 15:17:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 062FHd9c016679 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 11:17:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7183A201181E; Thu,  2 Jul 2020 15:17:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CA5B2013593
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 15:17:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC5AA108C269
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 15:17:36 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [62.140.7.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-119-5rIUqN1mPdqbrdLTxslD3w-1;
	Thu, 02 Jul 2020 11:17:34 -0400
X-MC-Unique: 5rIUqN1mPdqbrdLTxslD3w-1
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur03lp2051.outbound.protection.outlook.com [104.47.10.51])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-4-DejLBegxPxqVenYK_x4bjg-1; Thu, 02 Jul 2020 17:17:32 +0200
X-MC-Unique: DejLBegxPxqVenYK_x4bjg-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB8PR04MB7163.eurprd04.prod.outlook.com (2603:10a6:10:fe::24) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20;
	Thu, 2 Jul 2020 15:17:31 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593%3]) with mapi id 15.20.3131.035;
	Thu, 2 Jul 2020 15:17:31 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 4/4] libmultipath: fix checker detection for nvme devices
Thread-Index: AQHWT/iJEuFvNAaKSEegDDFn2J6fMqj0Z9wA
Date: Thu, 2 Jul 2020 15:17:31 +0000
Message-ID: <c7c3a9111d9b4d0854ea0e6f6faeefc7437e01fb.camel@suse.com>
References: <1593643176-6206-1-git-send-email-bmarzins@redhat.com>
	<1593643176-6206-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593643176-6206-5-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3
x-originating-ip: [94.218.227.113]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d651e52-eb2c-4eb4-a05c-08d81e9b0a4f
x-ms-traffictypediagnostic: DB8PR04MB7163:
x-microsoft-antispam-prvs: <DB8PR04MB716300D1C7355C05123B6403FC6D0@DB8PR04MB7163.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:800;
x-forefront-prvs: 0452022BE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gG7z1wOazIZPI0VpPhFimzr3Rhre6YuZPT5LLh7aycGnSjLh4q7zp3F8Gk60tZND5QrmQOg7zzXESh1/8hfY68o1jXYD3qr58LaXuLKpjqcTzwzb+64q75a6XCyQKf+WOHF4//IqKKXUVv4DggGZlA4W4sGG1pXcSKozZi6HX+ULE9PENdnulhxR6inH0Ra4z+I7pIwBIHSgif/x57Kmiy4du3OK69aHIAVUg0bvn2BPHFs8l89+70ch1xpR11Wluo5DOJhWMdwYdzpqi9wnVk53qrY9onf/1fxU+67b+fyEtjVBHOLGjBZ6ciTCg+O6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(346002)(376002)(136003)(366004)(39860400002)(396003)(316002)(36756003)(6486002)(8676002)(8936002)(110136005)(6512007)(71200400001)(2616005)(4744005)(5660300002)(66476007)(186003)(478600001)(4326008)(6506007)(66946007)(26005)(66446008)(64756008)(66556008)(76116006)(91956017)(2906002)(83380400001)(86362001);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: olsuK+8i4QNL8Y3VGd8+Lnh4t7CkBvG82jdGkz2HIUqIk61BBK/jNiC9dmqY7AyevgNVMnbd/NSYinvC3uJzhVlfTGGyZLXLF4N9wSCWaUYEpRqreLjvXovQZUJpv607Vmzuv2+C3Ww07ZMYv5gXf5U9Ssbf56jYSqIH6rF7h83F0sm3PEzZKbA2SdpKVj5dU6AMXx2Te2v7fFwkkc7W5MoaV6Ik5ouFoB0Nt/NGW1FENWNb+fyRhNqqTItIPRLFV1+FLSnVtIYRHuriRt79bjrLqC+cssWsJM7lpdhQg5gejSKAxAAro1zY8ZNSC4BLVmWefJRvhkdITxm1N94/aSpDrDbt/49g+CGYLcks+i/YDexiwPJmHLCbiRM9YpkabbZwr1Ag+9AvEcxRkls3JjkOsxXnwljFfU2uywLw+DXzQsqTo6Jn+PSIIXW+LJPmUJO+xGbtpsHJr1uWDip+Vjji5tDiMUWtqX/WSoGK8VlgZlETNrio1JXl7HXLCXlx
x-ms-exchange-transport-forked: True
Content-ID: <C6504E74C40B7748864AFC103779419A@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d651e52-eb2c-4eb4-a05c-08d81e9b0a4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2020 15:17:31.4190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b1RpwdrhiYmKP2XH+w86ugREHezxRkp9t+wLGHOeLnCURjRAa2mK+C5nWZ3CfGxUYnz0Ohy+GMTzYfFDQSYw3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7163
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 062FHd9c016679
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 4/4] libmultipath: fix checker detection for
	nvme devices
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-01 at 17:39 -0500, Benjamin Marzinski wrote:
> In order to fix hwhandler autodetection, commit 8794a776 made
> detect_alua() differentiate between failures to detect whether alua
> was
> supported, and successfully detecting that it was not supported.
> However, this causes nvme devices to get the TUR checker assigned to
> them. This is because there is nothing in detect_alua() to make it
> only
> work on scsi devices, and select_checker wasn't updated to handle
> detect_alua() failing without setting pp->tpgs to TPGS_NONE.
> 
> detect_alua() should automatically set pp->tpgs to TPGS_NONE and exit
> on
> non-scsi devices. Also, select_checker() should not assume that a
> devices is ALUA, simply because if failed to detect if alua was
> supported.
> 
> Fixes: 8794a776 "libmultipath: fix ALUA autodetection when paths are
>                  down"
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

Reviewed-by: Martin Wilck <mwilck@suse.com>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

