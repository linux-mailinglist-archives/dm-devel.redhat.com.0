Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE75B1922
	for <lists+dm-devel@lfdr.de>; Fri, 13 Sep 2019 09:46:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 54A4E1056FB1;
	Fri, 13 Sep 2019 07:46:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3681E10016EA;
	Fri, 13 Sep 2019 07:46:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F3D574A460;
	Fri, 13 Sep 2019 07:46:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8D7gYFn005728 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 13 Sep 2019 03:42:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 59A7D6013A; Fri, 13 Sep 2019 07:42:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE234600CE;
	Fri, 13 Sep 2019 07:42:31 +0000 (UTC)
Received: from m4a0041g.houston.softwaregrp.com
	(m4a0041g.houston.softwaregrp.com [15.124.2.87])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 60F098BA02;
	Fri, 13 Sep 2019 07:42:25 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0041g.houston.softwaregrp.com WITH ESMTP; 
	Fri, 13 Sep 2019 07:40:35 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Fri, 13 Sep 2019 07:37:38 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.72.11) by
	M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Fri, 13 Sep 2019 07:37:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=kd2Lmsk6/5z2tJEu9PeeYAWk3nCUzHEL6mlb8WbnrQWOsfxel9kadyojRTMZelLQypkgYPQlnES8/A9NsVX14HxhuEVBErw5mCn+qVPCXKYabPg/1P7onaPe9PG6XbUyb4mTl0/DH/QtBNy74NJzl6A82gyV6UhZ2det6mkxAATyF50ll2eVXSq6GyyNuy5aH2bD8bXjnX2CdlZPlN8WoAsh3M4kD7R0hrJQcGV6NFgGR1PQyzeQhKY0bSkJPO0dLFFxuRiv7Wn+228M7+k3Zeckj/cKlqbrEKqDNYuOcR9poc7JEyFBjg7gZO+DvgwXQLhxxpRNH86bMGdoSUKXLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kOfpjSef58WmrSXG809IozstwqBlbt1qi0iz2oxy3nQ=;
	b=RCgEagrdTe7LnX9AHkvJMIAb1mBI0Pgku2CAzzDlRB8GDytlA9hGuQvH0Td5f56ukbhO92TExOI36NM8vBfULaU4yNs/GIQBY74jiCH8edQSJhAPugNRbOzY9fCUggqUic+IdomBRfREzUMnL05C69YRItKQl6xSFKFTzw/jx2twgYsxIP15CbqqgbcwjkM4Du1MWlrsmItWHsqFlBsc/LBsdaFp42kFhqoiVb8uiQRk70C98O8Sa53pCeU/UxLT2M/xw3MeyqM7EAUKYZIf/dqend6dWxScLOzNPv7O7dbZJfMfw5T/CwxC1qkDGmLgFl4u4fD/J+rXILFtl0aJ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3398.namprd18.prod.outlook.com (52.132.246.221) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2263.15; Fri, 13 Sep 2019 07:37:32 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::d507:1099:1d46:c025]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::d507:1099:1d46:c025%6]) with mapi id 15.20.2241.018;
	Fri, 13 Sep 2019 07:37:32 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 1/4] mpathpersist: remove broken/unused code
Thread-Index: AQHVagYarK7j3BMvBUuJQiY/ovZayg==
Date: Fri, 13 Sep 2019 07:37:31 +0000
Message-ID: <689575ae61b252c9233e65df1382bf3a7673fdae.camel@suse.com>
References: <1568155161-9343-1-git-send-email-bmarzins@redhat.com>
	<1568155161-9343-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1568155161-9343-2-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [90.186.0.117]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b61208ed-db07-4383-a969-08d7381d3d24
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:CH2PR18MB3398; 
x-ms-traffictypediagnostic: CH2PR18MB3398:
x-microsoft-antispam-prvs: <CH2PR18MB3398E885812B72556A06DF96FCB30@CH2PR18MB3398.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0159AC2B97
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(199004)(189003)(7736002)(66066001)(8676002)(91956017)(71190400001)(71200400001)(6506007)(99286004)(11346002)(446003)(110136005)(476003)(2616005)(256004)(26005)(66446008)(64756008)(66946007)(66476007)(76176011)(5660300002)(6436002)(102836004)(66556008)(186003)(86362001)(486006)(229853002)(14454004)(25786009)(6486002)(53936002)(36756003)(2501003)(6246003)(478600001)(118296001)(4326008)(6512007)(2906002)(316002)(6116002)(8936002)(3846002)(81156014)(81166006)(305945005)(76116006)(4744005)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3398;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8U/ovOWMQr/zwOkZWXTQQPN2sNARP2fJn+pIUEg3IIAw0LiNagKXf6tJEoTihshA2i+gAcPCORud/ZLrZc5adq3WjBJiBOOGQKWWzA4CO7J1XF3fpVax8cOgK5T6SpAMtN6NZD19MxP1z6ouUdLy2L49j3qOvNz/XmwbspawhF1m4sEKywNOjlqTiiUOzlw/ph3v4WEPUwPA7S+YKLd8/2QcMGpF8NCU/obcL5thl7pxRhcMxixFIZJeK4SOHncHd2ViJCItjh2/c4ymcKn4pLOa2MLwiIhw9AKRYoj4gXD/dKHoHmOklv8Mpi/+AS1rXaT6dhlGzvXVIEyOH+VsHar8ou9vq1sH3tTK9dX1OjwRYhrhCnpvmmreHvPdiT1zivoTHHrKz6a40CfUTqJbGW7tXxwBjzfamJ4PUbkm0OY=
x-ms-exchange-transport-forked: True
Content-ID: <A931A6F833013740AAD7CEDD31D089CE@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b61208ed-db07-4383-a969-08d7381d3d24
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2019 07:37:32.3016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O7Ug82IwGrJad2+JxhxslM7q8RpBikvztv37gvvlnz06zOuTjII57vDsBE+ZbwMK41cyJpi3yf5w5oDkK1vjEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3398
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Fri, 13 Sep 2019 07:42:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Fri, 13 Sep 2019 07:42:30 +0000 (UTC) for IP:'15.124.2.87'
	DOMAIN:'m4a0041g.houston.softwaregrp.com'
	HELO:'m4a0041g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.87
	m4a0041g.houston.softwaregrp.com 15.124.2.87
	m4a0041g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x8D7gYFn005728
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/4] mpathpersist: remove broken/unused code
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Fri, 13 Sep 2019 07:46:42 +0000 (UTC)

On Tue, 2019-09-10 at 17:39 -0500, Benjamin Marzinski wrote:
> The test for an empty pp->dev in updatepaths() dates back to when
> disassemble_map() didn't fill in pp->dev for newly added paths, and
> it
> was meant to catch paths that got added by disassemble_map().  With
> the
> mpathpersist speedup code, all paths get added by disassemble_map().
> However, disassemble_map() now calls devt2devname() to set pp->dev if
> possible.  This means that there is no point in calling
> devt2devname()
> again in updatepaths(). If for some reason it did return success, the
> current code would still fail, since it doesn't set pp->udev in this
> code path. The best thing to do if disassemble_map() couldn't set
> pp->dev is simply to fail the path.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmpathpersist/mpath_persist.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)

Reviewed-by: Martin Wilck <mwilck@suse.com>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
