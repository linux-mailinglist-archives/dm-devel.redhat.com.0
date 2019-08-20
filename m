Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E972396663
	for <lists+dm-devel@lfdr.de>; Tue, 20 Aug 2019 18:30:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 28BD3A35FF3;
	Tue, 20 Aug 2019 16:30:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44B956060D;
	Tue, 20 Aug 2019 16:30:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B152A18005A0;
	Tue, 20 Aug 2019 16:30:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7KGTuTa000728 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 20 Aug 2019 12:29:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0460D27CD3; Tue, 20 Aug 2019 16:29:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx23.extmail.prod.ext.phx2.redhat.com
	[10.5.110.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D96827C46;
	Tue, 20 Aug 2019 16:29:43 +0000 (UTC)
Received: from m4a0041g.houston.softwaregrp.com
	(m4a0041g.houston.softwaregrp.com [15.124.2.87])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A8F8106BB21;
	Tue, 20 Aug 2019 16:29:40 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0041g.houston.softwaregrp.com WITH ESMTP; 
	Tue, 20 Aug 2019 16:24:30 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Tue, 20 Aug 2019 16:25:01 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.11) by
	M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Tue, 20 Aug 2019 16:25:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=MVdjB7cvTbXANhQPby+w6QXY0p7nsVzGYaF7SyMSEx7oKuswcY3l4uCGi5nKnjWlvNmMAPD6PYfixb0SKhmN5PVAuFObWY4gcYgy7i67LdF/uZrN2Rot7mmGBb2tnA7vsHgU8wVBBzMdCuhtVfMk5DD25TOFoyOUyLiDbofVYd8mpgYedIhbg4tOhd0iLq3xOgyUQEfjncCdtrOeJ4L9q+gy6EVwYh4bs46xQmR9vKvGrUvlueTXROnQOmgGGztm0JkK9BXPv4FbAtMck6O9AldfSyPa9W2Bum2rrBbHWf2PpaFn+tef8Zu1H/Ic5SEnFez53IPu2HIOmpzkRV0njQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JSSskPm5YQVRCG5h++QssCvfaWGVJihcyvd7O+fIY2w=;
	b=NsZq31Mn4ZkgByJF0uHAZ5+Z39eoExYCpJpPELvclUrqTLZN0i1M48vX5gqHm5G/nxIJ7e9k7kPAvAAyjtxrTNvBq6pp0XsWD/LB8Reiwg2I4GsbyKyGcOZCPEi0nG+NQRXQXow4LILgsbD4+J26oECzpBRWj7zaoLccDoMnzPcezuM0nAiwISX7Um3PiO1aEh1hXWqb6zp2aC4TGXFNi1dGfEJqRRbOL9V/UtHr3Bhyr2C30tGXVOrIKTa5xkvXs6+1XH7fvS5Y3N6lcS6QXo8M3w45pYiX4CpKTY2AmHXmcrC9SHbwhm5r3H1Kjsmd5rdNE2cE05olOsPX1ONWDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3141.namprd18.prod.outlook.com (52.132.244.75) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2178.18; Tue, 20 Aug 2019 16:24:59 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::650e:1c23:2bf1:fca8]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::650e:1c23:2bf1:fca8%6]) with mapi id 15.20.2178.018;
	Tue, 20 Aug 2019 16:24:59 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [dm-devel] [PATCH 1/2] multipath.conf: add "enable_foreign"
	parameter
Thread-Index: AQHVU3hIcgySVIT/9UW/gH0roU/Bi6cEQMwA
Date: Tue, 20 Aug 2019 16:24:58 +0000
Message-ID: <3913aa7aa45297995fc8776bc7d4496ef9fbe3f8.camel@suse.com>
References: <20190815144638.5664-1-martin.wilck@suse.com>
	<20190815144638.5664-2-martin.wilck@suse.com>
	<20190816201218.GF25414@octiron.msp.redhat.com>
	<da712bc269003e39dd35e8d7799992ff1d650c6a.camel@suse.com>
In-Reply-To: <da712bc269003e39dd35e8d7799992ff1d650c6a.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf64ccdb-4e60-4c89-b7b1-08d7258af1f2
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:CH2PR18MB3141; 
x-ms-traffictypediagnostic: CH2PR18MB3141:
x-microsoft-antispam-prvs: <CH2PR18MB3141A04B5C10FD528486659FFCAB0@CH2PR18MB3141.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(199004)(189003)(71190400001)(6512007)(229853002)(316002)(26005)(25786009)(478600001)(2501003)(81156014)(53936002)(476003)(2906002)(446003)(11346002)(186003)(2616005)(256004)(486006)(86362001)(7736002)(305945005)(14454004)(14444005)(8676002)(8936002)(76176011)(6506007)(1730700003)(66476007)(81166006)(66066001)(76116006)(91956017)(71200400001)(6916009)(99286004)(66946007)(118296001)(6116002)(6436002)(450100002)(6486002)(5660300002)(102836004)(4326008)(2351001)(3846002)(66556008)(5640700003)(6246003)(66446008)(64756008)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3141;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Kn39ViwCTzO3UEF0CrtGfFS6YmQOkQOPLZDyMlyqqDUT1FN/dQGBtl0S6B++V/ElEyejXvJYbPr/bz2xXymOBEgc8cfoPlOaJRhR7HNMDudQxYo7tO1V5sE/DjH8Ch0ad1SeIRw5cs91JhvM8Qc/b5Y5rLKR1TyIs8t/bZTftillSk/oY8/JEp2VY8Y+xWEQOLgxh/cZQtt6WYd+LdmZOc2kVnvCPiNgzAttYAhrb8kW+g7pmG50IjS409Wbz+4uhZcd8PVloH6cIJIKsOyZ4DxoyCeHOfWgDHKEUORIJyHDr7c4exVpjfnwxrb4syxnE43KxC+m/pbPzKnDM/3XSKhlbCMuYxCmaZpG07knNbAoTsJHsniuQ53vMj05MBbkJMPAzCK99IW7u9PUknw1Ym+eitMFDi7FXXOK0Madq5k=
x-ms-exchange-transport-forked: True
Content-ID: <A0E4AF764AC64A4788D3F8AA6B3AC521@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cf64ccdb-4e60-4c89-b7b1-08d7258af1f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 16:24:58.8386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Aljf8JLxzydK+bIaKMnHCQqaFRHGpGCcZScUckC8SoPNj+wnrHnJG+/kZclhr+R2sPZ8ku1Sr6FxA/SP3OaopA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3141
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.64]); Tue, 20 Aug 2019 16:29:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]);
	Tue, 20 Aug 2019 16:29:42 +0000 (UTC) for IP:'15.124.2.87'
	DOMAIN:'m4a0041g.houston.softwaregrp.com'
	HELO:'m4a0041g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.87
	m4a0041g.houston.softwaregrp.com 15.124.2.87
	m4a0041g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.64
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7KGTuTa000728
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/2] multipath.conf: add "enable_foreign"
 parameter
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]); Tue, 20 Aug 2019 16:30:08 +0000 (UTC)

On Mon, 2019-08-19 at 20:32 +0000, Martin Wilck wrote:
> On Fri, 2019-08-16 at 15:12 -0500, Benjamin Marzinski wrote:
> > On Thu, Aug 15, 2019 at 02:46:54PM +0000, Martin Wilck wrote:
> > > From: Martin Wilck <mwilck@suse.com>
> > > 
> > > This new configuration parameter can be used to selectively
> > > enable foreign libraries. The value is a regular expression,
> > > against which foreign library names such as "nvme" are matched.
> > > By setting this to a value that matches no foreign library
> > > (e.g. "^$" or "NONE"), foreign code is completely disabled.
> > > By default, all available foreign libraries are loaded.
> > > 
> > 
> > This will stop the foreign libraries from even claiming devices.
> > Won't
> > this mean that pathinfo() will now treat these devices as
> > multipathable
> > paths, since is_claimed_by_foreign() will return false? 
> 
> IMO this won't happen, because we ignore the native multipath path
> devices anyway as they're "hidden", and we ignore native NVMe
> multipath
> maps because they have "nvme-subsystem" subsystem rather than "nvme"
> (commit b18ed66). But I'll double-check again.

Confirmed. With nvme_core.multipath=Y and the nvme library disabled,no
NVMe-related output is printed.

Ben, with that in mind, would you ACK this patch?

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
