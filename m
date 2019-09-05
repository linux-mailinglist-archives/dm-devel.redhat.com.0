Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE2CA9C22
	for <lists+dm-devel@lfdr.de>; Thu,  5 Sep 2019 09:43:21 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 29BBB106E292;
	Thu,  5 Sep 2019 07:43:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F92E60126;
	Thu,  5 Sep 2019 07:43:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F7B81802218;
	Thu,  5 Sep 2019 07:43:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x857h1SA022326 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Sep 2019 03:43:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0C54F5D772; Thu,  5 Sep 2019 07:43:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78F555D721;
	Thu,  5 Sep 2019 07:42:57 +0000 (UTC)
Received: from m9a0001g.houston.softwaregrp.com
	(m9a0001g.houston.softwaregrp.com [15.124.64.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9C5A306E115;
	Thu,  5 Sep 2019 07:42:42 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0001g.houston.softwaregrp.com WITH ESMTP; 
	Thu,  5 Sep 2019 07:42:06 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Thu, 5 Sep 2019 07:36:59 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.72.10) by
	M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Thu, 5 Sep 2019 07:36:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=f//vn0sO+WkUFtNb6g2/KmEtQ8qMGTrtU3g47VrsQIQO+ZEMKECIygmIiis9lsAI78qiRanZM3JlYyTdgY/61ddnDLGpvwYNu5bOC4pwH+1RLqneQX6nh+PRpLpKhjo4gpTlzWtQ9IEN1L1jW3cs+Z72DpuhBqKtbXhYTBnYPmEyQm25sqgG0BSsd1Z2andQjX+m1k+L6ML9wYI+dCg8rxxav/rzj8IZAOM94MdWZhdwkz5X5JUN6E9gWMYuL/fbQu0EOWhRcMr+/1GjyeL/1Ug4sKDSXeZvg9YRs2URc2C05bhK9xDNcfbomprnZwiSTrihrqJpNaw4tMLUHM1XBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Clx0jMggRDbnfPGdhiuJGnmg231ikjJiszUF10MxlYo=;
	b=EmyH5ZBM3VWyYbHCfxaS4I+/96GMBuEyv2meaVIc5UcyMuNjqvTz/yMmOK5domaDHaBBlAEIzxf8bmS30kegHLsfiV4sg7tZfLSZYO1x2UlpKK9dUfHPy8sRIJsDL39oXMKC8VCnz0cRUoou0BVpPdqg+bllj7lwz1nncP5AfUUnQtys0jX8fR5CnNmfBhpzbCfPku+S2f9X4EClroWoCX2/XNnwTy4oMqfY3Fljkst9ATxZRF+tKUhKx1PDzgqXOIvbwLB8ZwqGSp0zkbV7VWqVEeMjIjg73f/KRFU8g1UPVqqHNdb195xK1auC5CiHFDVyfNGxCm1n3UqdZTPWFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3175.namprd18.prod.outlook.com (52.132.244.149) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2241.13; Thu, 5 Sep 2019 07:36:52 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::d507:1099:1d46:c025]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::d507:1099:1d46:c025%6]) with mapi id 15.20.2241.014;
	Thu, 5 Sep 2019 07:36:52 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, "wu.chongyun@h3c.com" <wu.chongyun@h3c.com>
Thread-Topic: [dm-devel] [PATCH] libmultipath:  multipath active paths count
	optimization
Thread-Index: AQHVY7yvDLD5TfO4nkevkDluf0+ZKw==
Date: Thu, 5 Sep 2019 07:36:52 +0000
Message-ID: <e33a9aefa073e1d9c107dce12c32608afc50090e.camel@suse.com>
References: <413f046d0cfc4d5dbd39ebed92068c8b@h3c.com>
In-Reply-To: <413f046d0cfc4d5dbd39ebed92068c8b@h3c.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [90.186.0.117]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f626551-ea7d-427b-c939-08d731d3d222
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3175; 
x-ms-traffictypediagnostic: CH2PR18MB3175:
x-microsoft-antispam-prvs: <CH2PR18MB31753B08D42382B9DEA3A7D8FCBB0@CH2PR18MB3175.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(199004)(189003)(6436002)(6116002)(2501003)(14454004)(5660300002)(4326008)(3846002)(66066001)(11346002)(446003)(486006)(2906002)(66946007)(66476007)(91956017)(81166006)(81156014)(99286004)(8676002)(76116006)(2616005)(6512007)(476003)(36756003)(66446008)(64756008)(66556008)(76176011)(8936002)(2201001)(54906003)(316002)(53936002)(110136005)(186003)(86362001)(229853002)(6486002)(7416002)(6246003)(7736002)(256004)(25786009)(102836004)(118296001)(478600001)(53546011)(71190400001)(71200400001)(6506007)(305945005)(14444005)(26005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3175;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lXYaonDdmgNpkLB4rT7Z2KgDpdCd9/0hyBKUABKrubEqi3c1x0Y6ryeId/SnVnd80mHYh+c6IQDjTg4aK4Aa2Lj9tkEWGHL3B/d5iqCAV87mXgLjc14YgoewtDzVq+mjf2d/n6N6HwaxYVKWcs9MlnmoJ8cYTsB3NXC5N/K56uib6LSbdcIGpmmfaFJ9/G5o2FIi2ERUAofJa344SVz/Mt57zJfN5shUb2YyDRNuIPh74r94KT8aQtq/npnA5Z+dhmIFK0VeQFrc5DzVe4z18EDZLnc//6vLU2fwDaieZzI7ztEXsnNOoPE0gtf+6AxXUJBxwN1lYZ2T+iBwaV61z3F0Ezf/ykHFk5akIgJOqF3b1o0FJ8R9pFrFyZFnU4XP5a2cbMUnfIJ1dN1XfHMqN9EalXRTlAelfzuhZYd4Uj0=
x-ms-exchange-transport-forked: True
Content-ID: <99742E329A7D324DA053E4F0448D2E2F@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f626551-ea7d-427b-c939-08d731d3d222
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 07:36:52.7301 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j4GIJTypPkSva9ObrOfoloTJqVj+WiJwlumDI9NZmt1DlVaEXS+sPLRMpIV4ijpKYB+L/Uuj5ivZIumyxLQ5Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3175
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.47]); Thu, 05 Sep 2019 07:42:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Thu, 05 Sep 2019 07:42:55 +0000 (UTC) for IP:'15.124.64.66'
	DOMAIN:'m9a0001g.houston.softwaregrp.com'
	HELO:'m9a0001g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.66
	m9a0001g.houston.softwaregrp.com 15.124.64.66
	m9a0001g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x857h1SA022326
X-loop: dm-devel@redhat.com
Cc: "liu.cong@h3c.com" <liu.cong@h3c.com>,
	"zhang.chengA@h3c.com" <zhang.chengA@h3c.com>,
	"guozhonghua@h3c.com" <guozhonghua@h3c.com>,
	"zhang.duan@h3c.com" <zhang.duan@h3c.com>,
	"li.liangA@h3c.com" <li.liangA@h3c.com>,
	"changlimin@h3c.com" <changlimin@h3c.com>,
	"ren.qinwei@h3c.com" <ren.qinwei@h3c.com>,
	"wang.xibo@h3c.com" <wang.xibo@h3c.com>,
	"li.kai4@h3c.com" <li.kai4@h3c.com>,
	"zhang.guanghui@h3c.com" <zhang.guanghui@h3c.com>,
	"wang.yongD@h3c.com" <wang.yongD@h3c.com>,
	"huang.yongA@h3c.com" <huang.yongA@h3c.com>
Subject: Re: [dm-devel] [PATCH] libmultipath: multipath active paths count
 optimization
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Thu, 05 Sep 2019 07:43:19 +0000 (UTC)

Hi Chongyun,

On Thu, 2019-09-05 at 02:58 +0000, Chongyun Wu wrote:
> Hi Martin, Ben and other viewers
> 
> Cloud you help to view below patch which try to deal with a multipath
> active paths
> count not right issue, thanks a lot.
> 
> From deee7196ece43b01b8ee635e60ce465080905b5e Mon Sep 17 00:00:00
> 2001
> From: Chongyun Wu <wu.chongyun@h3c.com>
> Date: Tue, 27 Aug 2019 13:58:33 +0800
> Subject: [PATCH] libmultipath:  multipath active paths count
> optimization
> 
> Really count multipath active paths not use mpp->nr_active++
> or mpp->nr_active--, because there are other places might call
> pathinfo to change path state not only in check_path, if other
> places detect and changed path state but not do mpp->nr_active++
> or mpp->nr_active--, the active paths might not right any more.
> 
> We meet an issue which actually have three paths but after all
> paths down syslog report have three paths remaining so multipathd
> not send disable queueing to dm and this dm device been blocked.
> This patch might fix this issue.
> 
> Signed-off-by: Chongyun Wu <wu.chongyun@h3c.com>
> ---
>  libmultipath/structs_vec.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)


Thanks a lot for your patch. We've discussed this previously, and in
general, there's little reason not to do it - pathcount() is fast, and
could be made even faster. But if we do, we should ditch the nr_active
field altogether - no need to carry it around if we re-calculate it
anyway when we need it.

However, it worries me a bit that nr_active may go wrong. Both Ben and
I have reviewed the code and we thought the nr_active tracking was
correct. Something seems to happen in our code that we don't
understand.

 - can you please confirm that you are using the latest code,
containing e224d57 "libmutipath: continue to use old state on
PATH_PENDING", 9b715bf "multipathd: Fix miscounting active paths" and
(in case you're using the marginal_paths options) also 7d4b40f and
058df77 ?

 - If you have a reliable reproducer, would you mind adding log
messages to the code you just submitted, so that we can observe how
nr_active evolves in time, and perhaps understand why it's going wrong?

Regards
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
