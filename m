Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id F1FABE1596
	for <lists+dm-devel@lfdr.de>; Wed, 23 Oct 2019 11:17:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571822247;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/0RduXq1Kgqs7K6XQFMHzrv2CdOyfoQTL+V/nVMyEPg=;
	b=CKVb9ThA6KX/P1b+Y0Odt2k/bZc+j4Hlmr3TxDlzgyzTy8VYAkPLWyT1btpbjCHfuQX8n5
	VsNcgtMQsGMDizhy9xGV5znB5cAgur6Z0e4xXVryEqoP9Hy++wZdSYyhcWRWTtNNTsm8mb
	2VaKzbjkk6AH6fb0TuQf3NaeXqkyEao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-8xhg7NwbOpeSDMnLFuxACg-1; Wed, 23 Oct 2019 05:17:25 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A77A1800D6B;
	Wed, 23 Oct 2019 09:17:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59E1E600CC;
	Wed, 23 Oct 2019 09:17:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D49AD18089C8;
	Wed, 23 Oct 2019 09:17:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9N9Gq59017022 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 23 Oct 2019 05:16:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7D21860624; Wed, 23 Oct 2019 09:16:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx25.extmail.prod.ext.phx2.redhat.com
	[10.5.110.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D99F608C0;
	Wed, 23 Oct 2019 09:16:50 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B545710C0922;
	Wed, 23 Oct 2019 09:16:28 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 23 Oct 2019 09:16:06 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 23 Oct 2019 09:11:21 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.11) by
	M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 23 Oct 2019 09:11:21 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3158.namprd18.prod.outlook.com (52.132.247.221) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2367.20; Wed, 23 Oct 2019 09:11:04 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.028;
	Wed, 23 Oct 2019 09:11:04 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>, "bvanassche@acm.org"
	<bvanassche@acm.org>, "christophe.varoqui@opensvc.com"
	<christophe.varoqui@opensvc.com>
Thread-Topic: [dm-devel] [PATCH 45/72] libmultipath: fix -Wsign-compare
	warnings with snprintf()
Thread-Index: AQHVgUP/vRjgspJFLEGusG/rLD5KFg==
Date: Wed, 23 Oct 2019 09:11:04 +0000
Message-ID: <427b0092920fc26be91794a5a54cc0ca71183745.camel@suse.com>
References: <20191012212703.12989-1-martin.wilck@suse.com>
	<20191012212703.12989-46-martin.wilck@suse.com>
	<34e6fc87-10f6-efd7-c8df-710e56cc1956@acm.org>
	<f895f01df7c429abf4a32a395764513c92ecc3af.camel@suse.com>
	<42e85b61-3f38-af4e-a485-1ba230506d0f@acm.org>
	<690ab1be1dc189c6efebf5fb953f31f9f0341286.camel@suse.com>
	<b4e750e1-ecc1-853d-5582-fae16b3932f0@acm.org>
In-Reply-To: <b4e750e1-ecc1-853d-5582-fae16b3932f0@acm.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [90.186.0.223]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6b68bd8-c033-4ae7-70a2-08d75798ee8c
x-ms-traffictypediagnostic: CH2PR18MB3158:
x-microsoft-antispam-prvs: <CH2PR18MB315875D69DAFC9BC817B8614FC6B0@CH2PR18MB3158.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(189003)(199004)(8936002)(6246003)(4001150100001)(4326008)(110136005)(8676002)(6486002)(81156014)(81166006)(3846002)(305945005)(118296001)(2906002)(6116002)(71200400001)(76176011)(71190400001)(4744005)(316002)(7736002)(99286004)(36756003)(86362001)(25786009)(2201001)(186003)(66446008)(64756008)(66476007)(66556008)(5660300002)(6512007)(66066001)(66946007)(91956017)(76116006)(14454004)(478600001)(6436002)(11346002)(2501003)(446003)(2616005)(476003)(26005)(256004)(229853002)(6506007)(102836004)(486006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3158;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LpXuUAUye7sxXJYdgdi0bE2NETJLbZC2OrTObNe4NejvK7rjlPhTiBvynneLHTa9OvBDrWB6j/JpU+hR5l4HA1D2vn0Mmkri+bQ4FuAkuxt8RdH5dipVkCyKHNR+wcP9iA+Gy+4mSGDNirJNT2PkP+Qo96KlRUd/R5p2b6tUY3svDOeaW2Tp9eZqCjXZSxA+AN1BHcmiM432KmUOeu03xt2OaLtqv2PsWQdx3AjgEBShwhaZzmYz5LnQ/WPnGwRyyRU/BQsmeCIkaIH+lXAxVWEDCIMFOcLARjL7ogeoCbLGWj6sCvkY9OJYv6fxVW1cdLGYIDg1+Ke+sN0BUUCqOzwF9uSFq2sb0sYnAYL+kTdgrY4hjCopYJFsobgPsEV64FTMFVDyGzEabLr5aQD5I1DRNTZtdNSJwZlDU+sPA3C2/FY0JreZ1SKCk7Z4LCLb
x-ms-exchange-transport-forked: True
Content-ID: <8935A8793384E1468406C08E23B7F3E6@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b68bd8-c033-4ae7-70a2-08d75798ee8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 09:11:04.3752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VPFo3q1IqAJpa9KWCbM7EVsVrvTLG0y25ELwCOkdRDlyBc42efgpdF9BOg2Vb6rhkiy3Wg0oPeFu0Pr540SuVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3158
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.66]); Wed, 23 Oct 2019 09:16:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]);
	Wed, 23 Oct 2019 09:16:49 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.66
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9N9Gq59017022
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 45/72] libmultipath: fix -Wsign-compare
 warnings with snprintf()
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
X-MC-Unique: 8xhg7NwbOpeSDMnLFuxACg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hello Bart,

On Tue, 2019-10-22 at 14:32 -0700, Bart Van Assche wrote:
> I'd like to reiterate that introducing -Wsign-compare seems dubious
> to me.

While I disagree with this general statement, I now realized that
my approach to use (int) casts in this specific patch was indeed wrong,
because it prevents detection of negative snprintf() return values.

I'm going to rework this patch.

Regards,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

