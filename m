Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D99F94F14
	for <lists+dm-devel@lfdr.de>; Mon, 19 Aug 2019 22:34:19 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B7ED019AED9C;
	Mon, 19 Aug 2019 20:34:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1146B5C559;
	Mon, 19 Aug 2019 20:34:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 42CD92551C;
	Mon, 19 Aug 2019 20:33:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7JKXXsk025779 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Aug 2019 16:33:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 665A91001955; Mon, 19 Aug 2019 20:33:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25AD91001948;
	Mon, 19 Aug 2019 20:33:31 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 54FD03001836;
	Mon, 19 Aug 2019 20:33:24 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Mon, 19 Aug 2019 20:31:36 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Mon, 19 Aug 2019 20:32:38 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.72.10) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Mon, 19 Aug 2019 20:32:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=h/805cKAOwJktoi+HF5087LLQ4D/RVoPDxQKgf/zQKD28KiIwchaoC0A+HDsPRGxFYHQNs3sxew0ctRxXjRYNf2hqPictEvxlFxCFG4ykrRdgTg053pbMIEBCC66CdaFerxo3spLJ6SGOozT3bAI6a3rWWgy5c9ExAwS/16RKrQN9K3Qk9cHxZQzqYLgY725CGvbpOinN7wki8hH0S64zvp0kw7wB3WjBpDY3w9nO50osyTZ8uZMYmpiCt9KX+1jarSmN29v5Luw+FmfsO+hOemTL7C0qB8V0+4vxRt33ALCT2EX7SdAjyaU7pcgUYUR3HuTp3nQMFG+INhSVQfTSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=lfwS37vQFIqFXiCQu4/qoy1jubYTe/F40ecVCePGudM=;
	b=SW8ewh2B+AN3McLVwyyyTorSq1Z0/a0OvbmFN+QsrArUjhkcbJtlnLvKL5Mm8j4jnD/N5tM9+hejyJwjy+MHt7jkbyvJybUyipV/Mns0qnOKP5pX+Z4KpNCOy2ffe2PdQW5QwHyQ6VXJXm0LF/KFtvi5sTUKwnohJn17LumHWPHGy5yhkVrUNxcd5WVH/r+nv1FiB03oZ2TQ0EkBaGTXc+XNgEeNztKU0qAewMf5yCGf/SqyViA9in1IKezkxV223CWBq134D2vHthuoQ6ru7wJVKJFkbm0aSFamuyzK7fdNmzB+XtARjzpOKMRdKawoIFoKoluipUKzPfaTuKe7JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3240.namprd18.prod.outlook.com (52.132.245.78) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2178.19; Mon, 19 Aug 2019 20:32:37 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::650e:1c23:2bf1:fca8]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::650e:1c23:2bf1:fca8%6]) with mapi id 15.20.2178.018;
	Mon, 19 Aug 2019 20:32:37 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [PATCH 1/2] multipath.conf: add "enable_foreign" parameter
Thread-Index: AQHVU3hIcgySVIT/9UW/gH0roU/Biw==
Date: Mon, 19 Aug 2019 20:32:37 +0000
Message-ID: <da712bc269003e39dd35e8d7799992ff1d650c6a.camel@suse.com>
References: <20190815144638.5664-1-martin.wilck@suse.com>
	<20190815144638.5664-2-martin.wilck@suse.com>
	<20190816201218.GF25414@octiron.msp.redhat.com>
In-Reply-To: <20190816201218.GF25414@octiron.msp.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08c3bf60-21c5-45bc-a816-08d724e45fc0
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:CH2PR18MB3240; 
x-ms-traffictypediagnostic: CH2PR18MB3240:
x-microsoft-antispam-prvs: <CH2PR18MB32409F92F066FFB163AFC85DFCA80@CH2PR18MB3240.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(189003)(199004)(6246003)(99286004)(53936002)(71190400001)(6116002)(14454004)(86362001)(81156014)(1730700003)(81166006)(118296001)(3846002)(4326008)(66066001)(486006)(476003)(71200400001)(76176011)(66946007)(25786009)(66556008)(5660300002)(76116006)(91956017)(66446008)(64756008)(66476007)(6512007)(2906002)(478600001)(2501003)(7736002)(26005)(305945005)(316002)(2616005)(2351001)(14444005)(256004)(36756003)(446003)(8936002)(11346002)(8676002)(6436002)(186003)(6486002)(229853002)(6506007)(54906003)(102836004)(6916009)(5640700003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3240;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MUM9EAQw0YK2+lANFfS7eIpFZDB2Lvfe7dGRzd/Qw4bCpckaEG2XTEbkDel2F3ysvS6WNADf8l0JtjqWKBZ4CHRretFiYvsRPsHN077rbnrbMohZ/+e8rVNjN5NDsQaDNhIJvXGcPwQ3qw9VaxQcyBU7GWe1eBJu8thrTyHKPmNArSbhDNSPZI5cX2fEOTGE4E0y9zqFkfoZZYRc1t3qtSAa88cCLpMrzsC3BdN7KWWdKPDaPvZkS60At04LPB8HZgJhBP909Wb8JExAh4cGUJ1iO+vOJClbal1zzUaGCQ0wRfDc4tIjOqoaszJtx7hyvGYRoRkY6iyqVJUt2Xw9Tty1f7vyeHZ8Ps/R7z5e9bOZmkTpaKcnOyVxt4llaZ3WtkNUs4IjgQVM+xvj/8k8gGwmU5n8kafLGSMP3Q651hA=
x-ms-exchange-transport-forked: True
Content-ID: <CD4C0E7ED279B04CA14B6419438E6737@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c3bf60-21c5-45bc-a816-08d724e45fc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 20:32:37.2520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KWdY12msJlHTxoaHoQl5WPH14dH/2qV4GzFYy0Hhl/ChQs9rgdkz+kBT9dA1dj8PCUW5thSA/jiWbjcmHwwgZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3240
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Mon, 19 Aug 2019 20:33:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Mon, 19 Aug 2019 20:33:30 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7JKXXsk025779
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]); Mon, 19 Aug 2019 20:34:17 +0000 (UTC)

On Fri, 2019-08-16 at 15:12 -0500, Benjamin Marzinski wrote:
> On Thu, Aug 15, 2019 at 02:46:54PM +0000, Martin Wilck wrote:
> > From: Martin Wilck <mwilck@suse.com>
> > 
> > This new configuration parameter can be used to selectively
> > enable foreign libraries. The value is a regular expression,
> > against which foreign library names such as "nvme" are matched.
> > By setting this to a value that matches no foreign library
> > (e.g. "^$" or "NONE"), foreign code is completely disabled.
> > By default, all available foreign libraries are loaded.
> > 
> 
> This will stop the foreign libraries from even claiming devices.
> Won't
> this mean that pathinfo() will now treat these devices as
> multipathable
> paths, since is_claimed_by_foreign() will return false? 

IMO this won't happen, because we ignore the native multipath path
devices anyway as they're "hidden", and we ignore native NVMe multipath
maps because they have "nvme-subsystem" subsystem rather than "nvme"
(commit b18ed66). But I'll double-check again.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
