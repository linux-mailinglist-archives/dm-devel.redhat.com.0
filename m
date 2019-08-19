Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 536F49207E
	for <lists+dm-devel@lfdr.de>; Mon, 19 Aug 2019 11:36:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EBD67A39200;
	Mon, 19 Aug 2019 09:36:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4721D1DF;
	Mon, 19 Aug 2019 09:36:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F37D51800202;
	Mon, 19 Aug 2019 09:36:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7J9aBBd001262 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Aug 2019 05:36:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E263418B44; Mon, 19 Aug 2019 09:36:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx22.extmail.prod.ext.phx2.redhat.com
	[10.5.110.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 923A418B4A;
	Mon, 19 Aug 2019 09:36:09 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 877E4194308B;
	Mon, 19 Aug 2019 09:36:02 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Mon, 19 Aug 2019 09:35:28 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Mon, 19 Aug 2019 09:34:57 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.12) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Mon, 19 Aug 2019 09:34:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ItuJokEFh3QgIl23PhT9uXnTsMhshEXFVultJKP3la3Y9MzKKOQvztwn7eUIkvmtF7S0YxvfQKY5r656eAaJ4M4dHjBHC4LSZkSfn4Og4cwYdd9EVvKe5k3r8Jbukjw+s0+4MWzzyPi9IeUP4QuMYSXsPjzavblAwJ8lU8V38XezuFMCfk1rUsq30/iU/EGfDAr5llbDB+c8otaKxvQ9/ZdVGP2UtmRY3IQ/HP+zJoynTJxePE8T5oHU6AkbGTjAemS5yVcXLbP5AKpjJHGzV0aNIzezlOFrNCOzjTk0qYMDlnRrXf1IyeUIc2KFtzM/ui/I4b4mf4tP1DxwhnYYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=UdQ5Rz4pRK6z44G0v76mnstIdhvoeA/NgyLO5aCaAhw=;
	b=kqF5aQ6keNlBaWwLee1OShEHG2W2JQP4AgTbHfKbNlqsM9xwLX3JnxEwphSgkgL7I7tt91ywjZsC+zMgszlFhu3SScMVY1Pn6ySWmbqawkoLLj6g4htrQUD1VvEuxWa99NBYCfajjxR1SeLJ6KAuo4MwmkJCPcaPMfT/2vP9ttXbz2CAdV7nJUn3eu6VuAweNrhNgGT4wqzKT2BVg3UQKcEhBqzMJS4tc7NYCBIplG1TCpAJdsMlBkDsfiDJt0cLilmhkPM6F6fOIrhaHFk7QY9HBoFxENRobIQb7mpg9syqQ4ihqfOo5RIyRJzzL6jzYOLzA9k7irX58yyhHkwrkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3416.namprd18.prod.outlook.com (52.132.245.86) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2178.16; Mon, 19 Aug 2019 09:34:56 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::650e:1c23:2bf1:fca8]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::650e:1c23:2bf1:fca8%6]) with mapi id 15.20.2178.018;
	Mon, 19 Aug 2019 09:34:56 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [PATCH 03/16] tests: add path grouping policy unit tests.
Thread-Index: AQHVUuZZBB2nljUn+0SbFPtclDb9GQ==
Date: Mon, 19 Aug 2019 09:34:56 +0000
Message-ID: <bfff8ddfdde38982d9d8588f068fb089764a58f0.camel@suse.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
	<1564763622-31752-4-git-send-email-bmarzins@redhat.com>
	<7840aab31dd06de729f124af98da3498e0256556.camel@suse.com>
	<20190816210158.GI25414@octiron.msp.redhat.com>
In-Reply-To: <20190816210158.GI25414@octiron.msp.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e942ceb-700f-402f-9c01-08d724887f47
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3416; 
x-ms-traffictypediagnostic: CH2PR18MB3416:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CH2PR18MB3416CF53F0B7E94BC006F5B4FCA80@CH2PR18MB3416.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(199004)(189003)(66946007)(54906003)(316002)(66556008)(3846002)(66476007)(66446008)(6116002)(5640700003)(6436002)(53936002)(5660300002)(8676002)(8936002)(2906002)(64756008)(86362001)(476003)(11346002)(446003)(66066001)(2616005)(6916009)(6246003)(256004)(76116006)(91956017)(6512007)(36756003)(6306002)(118296001)(14444005)(4326008)(26005)(305945005)(478600001)(6506007)(71200400001)(486006)(99286004)(71190400001)(229853002)(2501003)(6486002)(14454004)(25786009)(102836004)(81156014)(81166006)(1730700003)(186003)(76176011)(2351001)(7736002)(966005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3416;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gyjSU9rXkVhEI9XoZDCXqRBnQ5mcdmhUdCXtLL7qDdMYXsH8VjUllFeYg/9c8HBxeZ/gVwF62BVVEOO09pA1qNK0ztvl4SeokQHuFppDcuduiTXkuTuqdo2TpmmEZYVfeQ/4u4vfneQ32ZZlJYM88fi9tGQgDYS4nWP8fXyizGrjHtHkjkN2hwlwYwdR7SKYU+he4LQCkgiUDt73uZOdqOV3fcpx0JEfmfY6RrtPwMYEGZ2xmWdWNdVwwxViqDQeUDBAvdaq7/Yrl4jFO3YhKVCToEUn+ghimzgG547c0J87ftOeU1T0sBLahLRW/Lb7T6MjDArxgIpTtzUreqKNXXF08A5S4etXhnrjOf25w6g7B8cXGEHrMTCodooUq9oVWHBChR6s7N+QAQI+dmYkOuKnZl39q00SGIp9k1sYcBA=
x-ms-exchange-transport-forked: True
Content-ID: <F7E749A13AF4A44389B92B82BF4C4FD9@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e942ceb-700f-402f-9c01-08d724887f47
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 09:34:56.4217 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oW+6OAxP8PbtSnS0o5oqxMQi4jhhEV7EMFIExgqMmnX+xOu9D8Fkpgj5k14cXeqLBfRB9vzE7Gqx8MkVvJsmJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3416
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.63]); Mon, 19 Aug 2019 09:36:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]);
	Mon, 19 Aug 2019 09:36:08 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.63
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7J9aBBd001262
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]); Mon, 19 Aug 2019 09:36:37 +0000 (UTC)

On Fri, 2019-08-16 at 16:01 -0500, Benjamin Marzinski wrote:
> On Wed, Aug 14, 2019 at 09:22:17PM +0000, Martin Wilck wrote:
> > On Fri, 2019-08-02 at 11:33 -0500, Benjamin Marzinski wrote:
> > > In preparation for changing the path grouping code, add some unit
> > > tests
> > > to verify that it works correctly. The only test that currently
> > > fails
> > > (and so it being skipped) is using MULTIBUS when mp->paths is
> > > empty.
> > > All
> > > the other path grouping policies free mp->paths, even if it is
> > > empty.
> > > one_group() should as well. This will be fixed when the path
> > > grouping
> > > code is updated.
> > > 
> > > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > > ---
> > >  tests/Makefile   |   2 +-
> > >  tests/pgpolicy.c | 708
> > > +++++++++++++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 709 insertions(+), 1 deletion(-)
> > >  create mode 100644 tests/pgpolicy.c
> > > 
> > > +
> > > +static void test_group_by_node_name_3_groups4(void **state)
> > > +{
> > > +	char *node_name[] = {"a","b","c","a"};
> > > +	int prio[] = {3,1,3,1};
> > > +	int group0[] = {2};
> > > +	int group1[] = {0,3};
> > > +	int group2[] = {1};
> > > +	int *groups[] = {group0, group1, group2};
> > > +	int group_size[] = {1,2,1};
> > > +
> > > +	set_priority(p4, prio, 4);
> > > +	set_tgt_node_name(p4, node_name, 4);
> > > +	assert_int_equal(group_by_node_name(&mp4), 0);
> > > +	verify_pathgroups(&mp4, p4, groups, group_size, 3);
> > > +}
> > 
> > Nothing wrong with your code, but this is one example where I would
> > say
> > our prio group ordering is counter-intuitive. Does it really make
> > sense
> > to order the group of two paths with prio {3, 1} *after* the group
> > with
> > just one prio 3 path?
> 
> That's kind of tricky, because with the round-robin path selector,
> just
> having one fast path in the group might be the correct answer, while
> with the dynamic path selectors, it seems like having both paths
> would
> be better.

FTR, the semantics were changed from summing to averaging almost
exactly 10 years ago:

91270ef "Use Average path priority value for path switching"

At the time, the patch author's rationale (blessed by Hannes' approval)
was that a group of 1 x prio=8 should not have higher precedence than a
group of 2 x 3 (details in 
https://dm-devel.redhat.narkive.com/dmvqjPHA/rdac-priority-checker-changing-priorities). 
While in the specific case the argument was valid, I doubt that it
applies in all situations.

>  My person issue with out path grouping is that I don't think
> that what group_by_prio is what many devices want.  For many devices,
> the paths are going to be grouped by something static, like what
> controller the paths go to.

True. In most situation that I have seen, "group_by_prio" is basically
a way to express storage states such as ALUA "optimized" vs. "non-
optimized" and "preferred". For a while I've been pondering to use
these states for grouping directly rather than the priorities derived
from them. So far I haven't come down to it.

Regards,
Martin


>   In that case, all the overhead of remaking
> that pathgroups whenever the priority changes is a bunch of wasted
> overhead. Also, it can cause situations where is multipathd notices
> a priority change at the wrong moment, it will temporarily make
> garbage
> pathgroups, with some paths using their old priority, and some using
> their new priority (which multipathd hasn't noticed yet).



> 
> -Ben
> 
> > Regards,
> > Martin
> > 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
