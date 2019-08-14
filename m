Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB7F8DFBF
	for <lists+dm-devel@lfdr.de>; Wed, 14 Aug 2019 23:28:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D8346C04510A;
	Wed, 14 Aug 2019 21:28:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFCF440EF5;
	Wed, 14 Aug 2019 21:28:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F39D18089C8;
	Wed, 14 Aug 2019 21:28:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7ELRjEQ006315 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 17:27:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 21B5D825F7; Wed, 14 Aug 2019 21:27:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88B27D1F8;
	Wed, 14 Aug 2019 21:27:42 +0000 (UTC)
Received: from m9a0001g.houston.softwaregrp.com
	(m9a0001g.houston.softwaregrp.com [15.124.64.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 609D530A7C54;
	Wed, 14 Aug 2019 21:27:38 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0001g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 14 Aug 2019 21:27:16 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 14 Aug 2019 21:22:18 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.72.13) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 14 Aug 2019 21:22:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Z7RA1IQMW5JkdzcosvXmAnTicgE1xVxbevlI07NkTclSf6TmApGMbJzs1+h/9AfswRFcpEbII4MRgG9ZDmuHOFQ4f54majE1uMNZOQ9B3b4AL048dXKbfF8T+4648YUCYL8RG+JTg1DaSDUUqYt20ti2MAO9HZpe+dlkp2REIpvZ0/dAlL+9uRsM92pMMvRjegERUrrhdoF7K4ZxOf9UWo99C9Hvy9qqVk06wihpXpDbs6QK3KM39A9Q8CTGhanJ58s3+On7UaGYd1LPQTNy+fsNakkIt7RSRUtGR7635Y6jSeQZReSe2b8kyF1SwgJJ9Bbj21D+gMTb7N9NB7f44g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rveXeLWmuQZtt0sPBfsYSD7LErw3dSxnnPO0fS+30sE=;
	b=ZNvY038MwT7Dxl3AFT7eswCE/iV2PZFiDUZK4EAm3fRo5XlMOyEFrGDaLpaetcHi6jD8rGir44QH/gUy8CALzTtXlnctK12MhlA1Hx3e9I/pvfILReJgg2KPgHWFzyVBleOxY/0HZjvfVmPaPNNtddzSf9DQUTR5kxQHAcHaV9ACSUv4/dZOjYDRk+ttDqcOxaOkGgZhrfSsaKmCI2o1kb5RXbL6Rb99P6kDEXpSo9QFacHQ2j6O7q7czM7/QwmcVnmySXNiYWeHnJmMZX4guNwb4b9tejhvaXuLvajy6+Kyp0WXa4JmVXhA8GsZ2i71B8rESNTR3JTuQ5OyQt3S8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3240.namprd18.prod.outlook.com (52.132.245.78) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.18; Wed, 14 Aug 2019 21:22:17 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2157.022;
	Wed, 14 Aug 2019 21:22:17 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 03/16] tests: add path grouping policy unit tests.
Thread-Index: AQHVUuZZBB2nljUn+0SbFPtclDb9GQ==
Date: Wed, 14 Aug 2019 21:22:17 +0000
Message-ID: <7840aab31dd06de729f124af98da3498e0256556.camel@suse.com>
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
x-ms-office365-filtering-correlation-id: 2df59373-e0bb-452c-c199-08d720fd7be8
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3240; 
x-ms-traffictypediagnostic: CH2PR18MB3240:
x-microsoft-antispam-prvs: <CH2PR18MB3240AF1AEA6C289155D4FA01FCAD0@CH2PR18MB3240.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(189003)(199004)(66946007)(64756008)(66476007)(81156014)(102836004)(76116006)(91956017)(99286004)(6436002)(478600001)(8676002)(4326008)(186003)(6506007)(81166006)(71200400001)(486006)(76176011)(6486002)(71190400001)(305945005)(6116002)(66446008)(2501003)(446003)(14444005)(14454004)(54906003)(316002)(86362001)(476003)(7736002)(2616005)(25786009)(8936002)(229853002)(11346002)(5660300002)(26005)(2906002)(6246003)(118296001)(256004)(3846002)(66556008)(53936002)(6512007)(66066001)(36756003)(110136005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3240;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eIRpObqWxPd39T3/pese2sDEkFJGKf/7NtqHyAPvfDykx+zEBxO5Up4mmO+oz3wksK327eLK7P36vYEZSVmfhgehye1KD6S3KnivGT4nAWXSMmN5w0Q5WaJpHZ98YWbSOEf4UGp7CCIVbJFsKQ/V9eWP0Re1aSqdsYxYONMIjmygGXmQb6/o8xhu6y9quMjMAFR+bqWJJvdX9WdNYFWMtmfEE52KcBlSe0hgMPHNUpZTxK1rqBTfvxDT8Vp8hPvWd3knnxIvkbN3pGn/Oh160kdMrmt7/4OzGZdsAZWjW+apftgTncnj7HO52n9bKQreW3LE+GHfHg/7xQVWecqc+cfWw0Zm34XAP4WYIeWiv9G7Jk6/7Fr5PNP5avsYP8F+mSbXMrj+NyvwRfEcF7ywqI+9v0q9VrODsl7Vg/nwxRQ=
x-ms-exchange-transport-forked: True
Content-ID: <98A6E2C30FB1524AA4CDDBBBE6000F3B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df59373-e0bb-452c-c199-08d720fd7be8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 21:22:17.2181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lp9QwnTnfySvxTkqpesZ75tcTVP0nR8Kdrd+RJxojXJ/Lf+gLEvSZuwp76a64DXEL60rt4SH7zSpLTngVtxa3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3240
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Wed, 14 Aug 2019 21:27:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Wed, 14 Aug 2019 21:27:41 +0000 (UTC) for IP:'15.124.64.66'
	DOMAIN:'m9a0001g.houston.softwaregrp.com'
	HELO:'m9a0001g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.66
	m9a0001g.houston.softwaregrp.com 15.124.64.66
	m9a0001g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7ELRjEQ006315
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Wed, 14 Aug 2019 21:28:09 +0000 (UTC)

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
> ---
>  tests/Makefile   |   2 +-
>  tests/pgpolicy.c | 708
> +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 709 insertions(+), 1 deletion(-)
>  create mode 100644 tests/pgpolicy.c
> 
> +
> +static void test_group_by_node_name_3_groups4(void **state)
> +{
> +	char *node_name[] = {"a","b","c","a"};
> +	int prio[] = {3,1,3,1};
> +	int group0[] = {2};
> +	int group1[] = {0,3};
> +	int group2[] = {1};
> +	int *groups[] = {group0, group1, group2};
> +	int group_size[] = {1,2,1};
> +
> +	set_priority(p4, prio, 4);
> +	set_tgt_node_name(p4, node_name, 4);
> +	assert_int_equal(group_by_node_name(&mp4), 0);
> +	verify_pathgroups(&mp4, p4, groups, group_size, 3);
> +}

Nothing wrong with your code, but this is one example where I would say
our prio group ordering is counter-intuitive. Does it really make sense
to order the group of two paths with prio {3, 1} *after* the group with
just one prio 3 path?

Regards,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
