Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3286B8E015
	for <lists+dm-devel@lfdr.de>; Wed, 14 Aug 2019 23:44:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D96A111A21;
	Wed, 14 Aug 2019 21:44:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88548900BA;
	Wed, 14 Aug 2019 21:44:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A544E24F30;
	Wed, 14 Aug 2019 21:44:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7ELhwN4006847 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 17:43:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C8D5282095; Wed, 14 Aug 2019 21:43:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FC5682098;
	Wed, 14 Aug 2019 21:43:56 +0000 (UTC)
Received: from m4a0041g.houston.softwaregrp.com
	(m4a0041g.houston.softwaregrp.com [15.124.2.87])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 51A89301D67F;
	Wed, 14 Aug 2019 21:43:50 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0041g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 14 Aug 2019 21:43:38 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 14 Aug 2019 21:40:54 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.8.12) by
	M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 14 Aug 2019 21:40:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Wf7mnJ3RSfkafD2ks4/wU0bwPWbJcLNcc/w7VUwGffJ4wpp9w+Nj3N+xiJoPX9NvyPLVW+doHUJ4O4qBYU976rNo/5kd8FBpIYVW+lH4+zaiRY0eCmXVXOzmNWQaaM8RwGKcp/qEkN6lIcPoupnue5ULU77T7mNghpuq0ic6ZPDkjKevY/0ZAf6lZsIBiT42j/wn/zM99aWfLHu99Vr6Y4zk4DPaIuqZ6beVmbIHexmJ4J5FhNwkyeP+FgMcv7rn36EPKq2XRWZ3OEWysLpbjVmzmQde6q1o14KwJ9Js7Qstg7A2EUwL4jHObajfXCu9XK/fH+Fm+Q1QNxVhpyAQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=yLZ4N9CYBIY7uocJOELLSXxkoZDkcCca1FroEwDiy4E=;
	b=iIY7T2Rz53nd4xo8dueOsDuzLrbkkbqSnqur4a76LIpCs3f3Njo6+AVx6JAd/kt5q2wVUbbP8H1Q8/bcIel1hDgyFTfy4ZofDCrAtTlUqmz0JIKZDAtXoeo6ZZXRgE30FYe5D5KRVyDdEtVqNXnbAEu89YyYPRRWY3mFizI97LF+YKFQh9Zc/Vr0LIHeaYSB6rS3igqWa5Ja69PdHbeQ+R4xxR6xhjuT82Pu3Lqpozhu4d0Kd1Dom/eT2fHuWpbdijipSholH+FvLCLYKaNmuL6DOZdeayB5KTM6rO9w7OA64/mXhSb5j4tUPDaznkhqpmMLXY6l/ziQ1h2UbHcOWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3222.namprd18.prod.outlook.com (52.132.245.20) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.18; Wed, 14 Aug 2019 21:40:52 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2157.022;
	Wed, 14 Aug 2019 21:40:52 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 08/16] libmultipath: consolidate group_by_* functions
Thread-Index: AQHVUujyOr6wg/3hqUuWV+UNyoQYqg==
Date: Wed, 14 Aug 2019 21:40:52 +0000
Message-ID: <650838594337c447eff0a136ecccc67efd29e71d.camel@suse.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
	<1564763622-31752-9-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1564763622-31752-9-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e66d309-81ab-4251-4f6d-08d7210014ca
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3222; 
x-ms-traffictypediagnostic: CH2PR18MB3222:
x-microsoft-antispam-prvs: <CH2PR18MB3222D21CBA86287F43F0D2A1FCAD0@CH2PR18MB3222.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(39860400002)(376002)(396003)(346002)(366004)(199004)(189003)(26005)(6506007)(8936002)(478600001)(8676002)(6512007)(102836004)(6486002)(316002)(14454004)(4326008)(99286004)(54906003)(110136005)(2501003)(86362001)(81156014)(5660300002)(76176011)(81166006)(486006)(11346002)(118296001)(7736002)(305945005)(2616005)(91956017)(66066001)(25786009)(256004)(4744005)(6116002)(71200400001)(186003)(53936002)(2906002)(476003)(36756003)(64756008)(66446008)(66476007)(66556008)(6436002)(6246003)(66946007)(229853002)(3846002)(446003)(76116006)(71190400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3222;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pWETfJtGz47CPino2lzUNlPDnQrUJcfGKiZEcX99aPbMxs3pOy9T710UZR80W7dZxpqdFW4/86XXeR2wlfM6wSqdg3tUjmS+R0uHFz3GGWWOoXh6Y5WYY2C8nQk/jMz/Z+AZRlszFrfLXEehFi3wqfDj94rKYl0HvqO/X5VMJ517YeKdOTE/NiyoIcxHqo3RPed3RHZ3cPWYAH98eC8dtfTMoouGYWjfqa899RRUXKn3RUeowqNCKXXD8G1IyfzZTruzDV1PbOIwx7OhYSO3cu/I/AcETSz6TlSVgnaZ6mHgsuEhUdiZ4KRLJqrjrB9BHmnXtyr5bswFRXoM/rREne696bV6tfrr2Gkr12ykAH3bVKgOUpKOG8U1kWq3Tn3kDrlX2gTmERtCaAteuINFAYL5If439tMBANdxJeq1R0I=
x-ms-exchange-transport-forked: True
Content-ID: <6BA1B38FFFFC1C45B7C8BBC4EF299931@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e66d309-81ab-4251-4f6d-08d7210014ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 21:40:52.6295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 35/Q93Pa+q0xWzQ34Tn74TRGC8ZVHgOD7kFCdDbz1+gvk7HrNG89Bj6bHEHC2EvCmzmeL5y03QFNnFKTWpKN1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3222
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.47]); Wed, 14 Aug 2019 21:43:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Wed, 14 Aug 2019 21:43:55 +0000 (UTC) for IP:'15.124.2.87'
	DOMAIN:'m4a0041g.houston.softwaregrp.com'
	HELO:'m4a0041g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.87
	m4a0041g.houston.softwaregrp.com 15.124.2.87
	m4a0041g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7ELhwN4006847
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mkumar@redhat.com" <mkumar@redhat.com>
Subject: Re: [dm-devel] [PATCH 08/16] libmultipath: consolidate group_by_*
	functions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Wed, 14 Aug 2019 21:44:22 +0000 (UTC)

On Fri, 2019-08-02 at 11:33 -0500, Benjamin Marzinski wrote:
> group_by_node_name() and group_by_serial() are exactly the same
> except
> for how the paths are compared. group_by_prio() is different but its
> pathvec solves the same issue as the bitmap from the other two
> functions, and since we are always running sort_pathgroups() after
> calling pgpriorityfn, there is no need to sort the pathgroups in
> group_by_prio(). This means that all three functions can be replaced
> with one function, group_by_match() that takes a match function as an
> argument.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

Reviewed-by: Martin Wilck <mwilck@suse.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
