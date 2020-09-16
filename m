Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3A78126C3B5
	for <lists+dm-devel@lfdr.de>; Wed, 16 Sep 2020 16:30:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-mle1hW8XOUe392G1qfMDLQ-1; Wed, 16 Sep 2020 10:30:37 -0400
X-MC-Unique: mle1hW8XOUe392G1qfMDLQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA9FC64141;
	Wed, 16 Sep 2020 14:30:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5ED285DE86;
	Wed, 16 Sep 2020 14:30:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 010B8183D02F;
	Wed, 16 Sep 2020 14:30:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08GESrnH015414 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 10:28:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 00B002018088; Wed, 16 Sep 2020 14:28:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFBEE2026F94
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 14:28:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B54E85828E
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 14:28:50 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [51.163.158.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-188-rv5v2b3gNQq_VABVkqY7LQ-1;
	Wed, 16 Sep 2020 10:28:47 -0400
X-MC-Unique: rv5v2b3gNQq_VABVkqY7LQ-1
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-31-YKO5-2XDOQq5q_qmE1up8A-1; Wed, 16 Sep 2020 16:28:44 +0200
X-MC-Unique: YKO5-2XDOQq5q_qmE1up8A-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB6PR04MB3000.eurprd04.prod.outlook.com (2603:10a6:6:b::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.3370.16; Wed, 16 Sep 2020 14:28:42 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::f1a9:5330:1129:da6a]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::f1a9:5330:1129:da6a%7]) with mapi id 15.20.3391.014;
	Wed, 16 Sep 2020 14:28:42 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 2/3] libmultipath: add uid failback for dasd devices
Thread-Index: AQHWi6mFEascmsVn90yH5naRLyjXtqlrVAaA
Date: Wed, 16 Sep 2020 14:28:42 +0000
Message-ID: <d98c9d1ef7e3f277e35832e11af317cf572476a3.camel@suse.com>
References: <1600206312-6497-1-git-send-email-bmarzins@redhat.com>
	<1600206312-6497-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1600206312-6497-3-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5
x-originating-ip: [90.186.0.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc8e0cc5-c052-4f82-6e83-08d85a4ccfc2
x-ms-traffictypediagnostic: DB6PR04MB3000:
x-microsoft-antispam-prvs: <DB6PR04MB30003AFD69421F8B840E412AFC210@DB6PR04MB3000.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WEwj93gn81+IRkfKQfo3ZDlb3wJzd2KWiFaGmr4VhdHWnF3JoPeI4x+K6ILAygzAaWeAXt1H1o6Qn7Qg7XR4xdxCgWRvwJNAeXLT4lxuZP49q6af3DYE2afLyE32UpPLKpBvrAPI3MgWTmF5uG9/kueIGgVZoowrHaUSeRdj20AJuQUpkX/ozzuT0RIqjT3Y03Y96VNhUkpba97tIErq1KDAaAJ7IG2FqH7UCDoLiODWL1B9xi2B017sZ/U5OG1EFXJ/sskxU3U7APxusz85GZ+jJVpiEiLbNDmZzko1jCJyKFObkmPC6QdMHDl17SWwdD6UvdAbgEoM9BIlz6DYvg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(396003)(366004)(376002)(346002)(136003)(39860400002)(76116006)(91956017)(66476007)(66556008)(66446008)(64756008)(5660300002)(66946007)(316002)(6506007)(186003)(36756003)(71200400001)(26005)(2616005)(2906002)(6486002)(6512007)(558084003)(4326008)(8676002)(86362001)(110136005)(44832011)(8936002)(478600001);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: W3SLTosKWRfoDh3yAu+p3lIv5v1BS0tKhhKOovpKfdWtVrFlm1GisWeREWWVSMtiecZmIAVqplwWDG+AP+65RYFDi0hQMmhUeEAlTxRZbA/zOLha091c1MKmcSbF4lsxHKIynZNSiLEWZSBbQTPHCwMq73jq9ksf+eulxZzMF3KZ+0hkQMiJI8gpDJTsCpA35+AKDvVHu8OpSPzaVSXGPdVNHgHpoBjM8xdIA7wyn+FIdJKIVpKbtm8vHgrxajeZvF371IgJAMexpq2cIfHDvX2fZ82iga51LGF9vZYhV5/Nm+s7mPQRvN6YM4cqIWHtIms47vpUH7jmk5XHhPXC6zBHV/uZWqqBTccf+cMrGkCSJUPTwIFCWQSFL8LWvdBAP9OCPD+Y0Qa+dVQwI3a7dQBBa9GvLqHLBY3PIsZVAVPR0zq7DZlxhJ21G+NQneiBEU56ybycV7J1WjcpUC4hPwEizzm+JrQz8e2a4jb8mGAuXKt+gMzbbX4WMYhQKcbj2wXLZuCKtj76AJIJ7jdvxM2Uiqm7Da4Hsrx9ul+hIWe8IskYlUmNSllBuFD1r8FJXe3FWStG9vWmbso6OBjwPhDHh9pa79oyfrXC5awKPZ0bFc8WHvj9Z1tP4pByqGun7PECBmPlgNAmJvX4ILUeDQ==
x-ms-exchange-transport-forked: True
Content-ID: <B864BDE4F5699043B2B11CC9E84C4844@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8e0cc5-c052-4f82-6e83-08d85a4ccfc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2020 14:28:42.1725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9xOLNwL7Ff7Sa2UZwg+SDqnsGKyaiVF3g0ZYZ+l2iEOhLFQaT9lLvmjanYAQyIfJvdZS3dzwn3VZGIR9rleJTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3000
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08GESrnH015414
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/3] libmultipath: add uid failback for dasd
	devices
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On Tue, 2020-09-15 at 16:45 -0500, Benjamin Marzinski wrote:
> Add failback code to get the uid for dasd devices from sysfs. Copied
> from dasdinfo
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

Reviewed-by: Martin Wilck <mwilck@suse.com>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

