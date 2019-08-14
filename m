Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 663758E01B
	for <lists+dm-devel@lfdr.de>; Wed, 14 Aug 2019 23:45:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A459430A00E9;
	Wed, 14 Aug 2019 21:45:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7910040EF5;
	Wed, 14 Aug 2019 21:45:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F40ED1800B74;
	Wed, 14 Aug 2019 21:45:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7ELeHZG006715 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 17:40:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B1D4C891D7; Wed, 14 Aug 2019 21:40:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 423508CB84;
	Wed, 14 Aug 2019 21:40:15 +0000 (UTC)
Received: from m4a0041g.houston.softwaregrp.com
	(m4a0041g.houston.softwaregrp.com [15.124.2.87])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 372749B29B;
	Wed, 14 Aug 2019 21:40:09 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0041g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 14 Aug 2019 21:39:57 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 14 Aug 2019 21:38:05 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.72.10) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 14 Aug 2019 21:38:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=EeqfbpdwifbXniuPSlvs4KCcCtKyOzh2ohYxmO/t7eW1RKud8+0DW2Htg1iOPTeQpfo7a3MqZr4M/7gyLqnMMSZE82X35HrDfYsrWk4MUrg2EMIQtpoRwXULAxrraIBFD7JupKWE1v9AOHuLkX1vw2qSxIHDbuE8sqqVEz4RrLR/Apm2mzlijmGKgqN7sD3dP2FTmiirFASeQr6B+12Q2xUIGe22ak2viB6GeWGvmGKqg/hZceA+J0W4e6beh3AerEITRtAqOevmFxiKMTe7bEtdsiimTb2pIVUuVSBE+OGKM+5GDWb5FO7eCy4rtH9GADsmlL3xqpDlrjAeXOS+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=26FVC1WUzOVngmSvt3XYTGYsMcXY/3VqZUbyJeTPbHw=;
	b=mo5CaM16jkZCOJhYT/cBAeGhsjgcq85k39k7os/wnmy1IXeAACEO21pvQsu20jZz7W0mhPAwN0k4WSjfj1mB9Vw+Td4fRkY4twHIc2Out2K9mdb6sfj92dzIh0KjWGov7RJN8SsqPPGko+EpJw1e3l2NCgp7I0FPwfT6xBPIYBNK3y1HAd69lgOyetLA4co2Z+vO12IQmJHySEu1M4c4kTfB7iZtsBwE2QlKQN7oGYimmRPrX+H3fNw3YImeXii56R/tE11h2pd3pruxpfRIgtCSvWCaUOQetQaBZxIrAEOKj/FjKav3CHBET7CHw9LprlWqSQbxEbUiQgSiZDIvcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3397.namprd18.prod.outlook.com (52.132.246.220) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.18; Wed, 14 Aug 2019 21:38:04 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2157.022;
	Wed, 14 Aug 2019 21:38:04 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 03/16] tests: add path grouping policy unit tests.
Thread-Index: AQHVUuiaBB2nljUn+0SbFPtclDb9GQ==
Date: Wed, 14 Aug 2019 21:38:04 +0000
Message-ID: <439ed044f9e9b2986e32f7c393367c16eb787a4a.camel@suse.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
	<1564763622-31752-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1564763622-31752-4-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95f0a158-2556-4625-bb0e-08d720ffb075
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3397; 
x-ms-traffictypediagnostic: CH2PR18MB3397:
x-microsoft-antispam-prvs: <CH2PR18MB33977B351CD0964E86CF1B6CFCAD0@CH2PR18MB3397.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(199004)(189003)(86362001)(486006)(64756008)(6436002)(36756003)(91956017)(229853002)(66556008)(66476007)(14444005)(118296001)(5660300002)(66946007)(256004)(8676002)(76116006)(66066001)(66446008)(6486002)(81166006)(4744005)(81156014)(478600001)(99286004)(2501003)(305945005)(76176011)(476003)(316002)(53936002)(54906003)(6512007)(110136005)(446003)(25786009)(102836004)(14454004)(7736002)(26005)(6246003)(71190400001)(71200400001)(2616005)(4326008)(6116002)(186003)(8936002)(2906002)(3846002)(6506007)(11346002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3397;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TuNE5ewsGo556GWBFvoaEXH8S8/Dq90Bsd3DnkRRYkHaASObYSnFOGBEsebzD555p/pL5s8mVoRSVNQOC5LgMfA9BjgI3Uc2LmE2gX6twCeoEg34M9A2T4K/qpcsz+NPK6qYSc557TC9/A+B2gYJu+a51nvVBM+Hju+Z2KcmMMq/9vfJVTlamS4vyh8wFwUX8AWG/zIntK9q+bEXRdI+Qz0yr/JU+PCV8xCirZs40kJt6jO5adfa55eGpURTP8q2hfIw2hf2nRl/9RvD00nK3DpQFaJHkEz4Nh4Vfwi4HGVjImCGz7ydf2BQZFuNymp9FY/zbGY3utHXC2W/5QBdUTjrt2WkiGxlSSe5C0/uuL8AXaEkIbPKlPG7PqkCHh+QupZEahD/ZHV1lAbsA2Ag8Jw0ifLrVbli5flL0p3Ojk4=
x-ms-exchange-transport-forked: True
Content-ID: <FEB16C9133CCDB41BA61CAD02F10DB68@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f0a158-2556-4625-bb0e-08d720ffb075
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 21:38:04.3840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3wP1xBwdHj3+mvwazsdpz/e/9OL9GG8KxpcMqYFYatKsGBIfGSC57tLocRJLMfT81qvvZAcOnTBZMd9CVMVRbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3397
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Wed, 14 Aug 2019 21:40:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Wed, 14 Aug 2019 21:40:14 +0000 (UTC) for IP:'15.124.2.87'
	DOMAIN:'m4a0041g.houston.softwaregrp.com'
	HELO:'m4a0041g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.87
	m4a0041g.houston.softwaregrp.com 15.124.2.87
	m4a0041g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7ELeHZG006715
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mkumar@redhat.com" <mkumar@redhat.com>
Subject: Re: [dm-devel] [PATCH 03/16] tests: add path grouping policy unit
	tests.
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Wed, 14 Aug 2019 21:45:17 +0000 (UTC)

On Fri, 2019-08-02 at 11:33 -0500, Benjamin Marzinski wrote:
> In preparation for changing the path grouping code, add some unit
> tests
> to verify that it works correctly. The only test that currently fails
> (and so it being skipped) is using MULTIBUS when mp->paths is empty.
> All
> the other path grouping policies free mp->paths, even if it is empty.
> one_group() should as well. This will be fixed when the path grouping
> code is updated.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

Reviewed-by: Martin Wilck <mwilck@suse.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
