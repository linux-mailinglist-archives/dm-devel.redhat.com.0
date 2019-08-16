Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BBF90A87
	for <lists+dm-devel@lfdr.de>; Fri, 16 Aug 2019 23:55:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2431DA2892A;
	Fri, 16 Aug 2019 21:55:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 933383796;
	Fri, 16 Aug 2019 21:55:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB34C18005B9;
	Fri, 16 Aug 2019 21:55:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7GLtbVr012035 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Aug 2019 17:55:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 71A66100194E; Fri, 16 Aug 2019 21:55:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx23.extmail.prod.ext.phx2.redhat.com
	[10.5.110.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC14510013D9;
	Fri, 16 Aug 2019 21:55:34 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5C351089041;
	Fri, 16 Aug 2019 21:55:26 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Fri, 16 Aug 2019 21:54:53 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Fri, 16 Aug 2019 21:51:39 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.14) by
	M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Fri, 16 Aug 2019 21:51:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=hBPirzlWWpW1eCDlNLghGUqxRRQNMBkC6xZmKWOmcVc1WZq/eRMfzmjlElYf/ARjLHVg/wXkpJZNUoG55wInYMeQ93kHV4XOjmCGku6suq+Kb54Rrl7WKg0nTTLUFJ7hSFE0Bx2D7NnkXZm/it5HFxav3T2r+HnPQM+2m2GTygpE+skXo2M+1qRuLs6PswjEZScVGqYR2brAK+qJkv75JBvRDdtiXceSf109BjDtZovWxAu2YZqWz447clLWt3WeNL8j68NQ+/Kg64o8pZkD8KEIrrlMzp/9irJIGeu8IlB/j02hpzV8E2KkBfRv8mZuhd4e2vu9btRrmy8TQeKV9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=fiB89XM7M4z0iMtRkEA3QxeW5bAva0PtcGNzWaSbNF4=;
	b=huA+4dhnhP5BflI6OF5ex/i/PHQ+ukxj7Pprp6NFc8tHqR51LPjX6KjPJMBUQ/I/k59qCEyGlCJZfWtbH8yCsL0h8vXKCNylhRS62EtKki5/u2LbshMmqP4qmM1nZycgtd1nIMAc1eMgFM2bINJn3xgKlAV2VZg2ds/Bgx+rP0qcUfF67x9u/W0NuLRix4FOHPzw6AVRfzBXpgz4a7FGcNsNjUVnxsn/lSLncHKNnp4m3NwqlSNSqYU/sxD0ftdbI2s106S085d2TJvIS77wiRnvvH+YGyG5hcTH+xwwuk4Ep43wREQYc5gIUqzIyMnk/nu2qBHa5eEA9LUHzR+LfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from BY5PR18MB3348.namprd18.prod.outlook.com (10.255.136.15) by
	BY5PR18MB3234.namprd18.prod.outlook.com (10.255.163.213) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2178.16; Fri, 16 Aug 2019 21:51:37 +0000
Received: from BY5PR18MB3348.namprd18.prod.outlook.com
	([fe80::c84c:509b:1392:59af]) by
	BY5PR18MB3348.namprd18.prod.outlook.com
	([fe80::c84c:509b:1392:59af%5]) with mapi id 15.20.2178.016;
	Fri, 16 Aug 2019 21:51:37 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [PATCH 14/16] libmutipath: deprecate delay_*_checks
Thread-Index: AQHVUuYj+ZROPdedPEmqdyGz2nek3w==
Date: Fri, 16 Aug 2019 21:51:36 +0000
Message-ID: <0e8350a968aa3fdfeeaa41bc4aaafcea26d238c2.camel@suse.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
	<1564763622-31752-15-git-send-email-bmarzins@redhat.com>
	<af2c96e14df9aad64dbeded65e6e0c02c9ff45cf.camel@suse.com>
	<20190816204734.GG25414@octiron.msp.redhat.com>
In-Reply-To: <20190816204734.GG25414@octiron.msp.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 594e5d44-6d92-4684-3732-08d72293e9c3
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:BY5PR18MB3234; 
x-ms-traffictypediagnostic: BY5PR18MB3234:
x-microsoft-antispam-prvs: <BY5PR18MB323411D05F99A970972F958EFCAF0@BY5PR18MB3234.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(189003)(199004)(14454004)(5640700003)(6916009)(76176011)(2906002)(476003)(229853002)(66476007)(66446008)(2616005)(11346002)(6486002)(446003)(1730700003)(81166006)(8936002)(7736002)(81156014)(4744005)(64756008)(3846002)(316002)(54906003)(6116002)(8676002)(305945005)(478600001)(2351001)(2501003)(6506007)(71190400001)(6512007)(71200400001)(36756003)(4326008)(118296001)(6246003)(86362001)(99286004)(26005)(66946007)(76116006)(91956017)(186003)(102836004)(256004)(5660300002)(53936002)(66066001)(6436002)(486006)(25786009)(66556008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3234;
	H:BY5PR18MB3348.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xD+uddbKTkE2ByCk+y09KMClJvjsb1krzOZo75bVW8KSCUHYMzGyRjXhv646+I/cYyVNJYPC1yH60EpwBmc1Z2SGOn07q9N/67ICrYor5AoC9qGzkNNX9NaTS6DqeadCtDPL1fnCw22X2Pt+HDT+r4s3BTuC6VsVk966EPNh+Bot2EUhVsexsrJTjkFQNk+wjeKav6WgQNelgZQcFr7a4nmxjn/Yv86oYkojAE5wtWhrToWB/T6wMJLCvj6UqRuN0jXGkPrFRLaroGT28TVqLW1shma2oJoC9L5hCXcdokLRW6cMFd0w7+/LAxTUgPi4xCFJBxqIm0FzF09ctuqlHTfh975NYuGdxr+e5xNSk7gE4YRPguEAwIstEqsVAYpVqTEPaTy3TuUdxFcuUpMDV7z+jtDUvPtdXwfoiwjdKrE=
x-ms-exchange-transport-forked: True
Content-ID: <4F9E3684A610D1499603181ED3AB2454@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 594e5d44-6d92-4684-3732-08d72293e9c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 21:51:37.0228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FKaEeu/DjLoUCC1UKCYgJrnC9pxIpOjddb0eoow2tOR9DC9l4PfC2XQ2lIiYKwX+SN073zpO6MUwEZtUVvLB4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3234
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.64]); Fri, 16 Aug 2019 21:55:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]);
	Fri, 16 Aug 2019 21:55:33 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 2.438 ** (DNS_FROM_AHBL_RHSBL, RCVD_IN_DNSWL_NONE,
	SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68 m9a0003g.houston.softwaregrp.com
	15.124.64.68 m9a0003g.houston.softwaregrp.com
	<Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.64
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7GLtbVr012035
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mkumar@redhat.com" <mkumar@redhat.com>
Subject: Re: [dm-devel] [PATCH 14/16] libmutipath: deprecate delay_*_checks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]); Fri, 16 Aug 2019 21:55:51 +0000 (UTC)

On Fri, 2019-08-16 at 15:47 -0500, Benjamin Marzinski wrote:
> 
> Err.. This patch does do the remapping in code (in propsel.c) just as
> you suggest..  right?

I'm truly sorry. It was late when I looked at this patch, and obviously
I got it all wrong.

So, I almost ACK this patch; but I'd like to simplify the logic by
using the delay_* parameters only if _none_ of the san_path_ parameters
have been set by the user (and also, of course, if no marginal_path
parameters have been set); similar to the logic of c8775cf "multipathd:
marginal_path overrides san_path_err". 

Users should IMO not be able to mix these parameters.

Cheers,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
