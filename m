Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 139B39F3A8
	for <lists+dm-devel@lfdr.de>; Tue, 27 Aug 2019 21:59:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B485190C022;
	Tue, 27 Aug 2019 19:59:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBD959F6B;
	Tue, 27 Aug 2019 19:59:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 254A94A486;
	Tue, 27 Aug 2019 19:58:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7RJwj9m005779 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 27 Aug 2019 15:58:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3C8F960497; Tue, 27 Aug 2019 19:58:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3652A60166;
	Tue, 27 Aug 2019 19:58:41 +0000 (UTC)
Received: from m4a0040g.houston.softwaregrp.com
	(m4a0040g.houston.softwaregrp.com [15.124.2.86])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C9A4246674;
	Tue, 27 Aug 2019 19:58:25 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0040g.houston.softwaregrp.com WITH ESMTP; 
	Tue, 27 Aug 2019 19:57:44 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Tue, 27 Aug 2019 19:57:44 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.12) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Tue, 27 Aug 2019 19:57:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Zlt5xC56g5FdDwrV1BrNI3i2U/lX0AVP9mtT4gosJrE933emmJ91ubFCXUAW5PSO+ddX4yiXWfs0SJjhtnm6voENLzh/X6XaX27xGSbyWbrj6poUegZedO5Ze5deFtgfWFA/MxGS01X0Eb7uhdM9ntJ42bSHk8Cr62px/dwWR8k8wTkvjy77E+uaj1QWTNPynTA0FLqtlhzOxiwF4yEPZ9bsCM+ZScc1pRCWAuTJZPRn3DNFaRv2/N28HVFs4W4JEHWw7kFQpZBYR00vuARljhSPNoNmi+ayHsBh39tQncHJh25a1NuB8vCDvmssDDo64c1hU8unflUl7uh806ehrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=UddKCbKlu0ijb8JprPuWK2EERkhiAIuiaPIqt/7Lv3I=;
	b=PckIca3IralE/z11h6VITCPDU1pos74jEOMb2DDKItPR4znpCrnxTAxttfAjE+x+o6p5Nu57fiIUt3TzLTpDsdMKGBf3kQ4j19EaAYAVT0Ww3wYkYKMihUHdFm/DIGO8/hk4vB+08OnRBWmfPwdmXC+ndrVDRdx6Ppv5l9VE6h5i19tQkXrk/iiOlgKuJGG7q49/bj33cfChczgEGB0lC3/40z4pCwJB3iAb6atFrLgFoipUDP5zX652O2F2XMyCZBz361PKnbjFcqhJPd8sTirTN8FqXeipWX9wSjw3ykGcIcovnnQkevU6Ng74afWsK+vdclUjLsT+u6+ztV/M0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3366.namprd18.prod.outlook.com (52.132.246.148) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2199.19; Tue, 27 Aug 2019 19:57:38 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::650e:1c23:2bf1:fca8]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::650e:1c23:2bf1:fca8%6]) with mapi id 15.20.2199.021;
	Tue, 27 Aug 2019 19:57:38 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, "wu.chongyun@h3c.com" <wu.chongyun@h3c.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [dm-devel] [PATCH] multipathd: "san_path_err" failure
	optimization
Thread-Index: AQHVXRGtvZ+E65U/y0ej8kmnSjs4LQ==
Date: Tue, 27 Aug 2019 19:57:38 +0000
Message-ID: <933edbd8794512cd35a48c596b36634b1bcd820c.camel@suse.com>
References: <CEB9978CF3252343BE3C67AC9F0086A378D9A799@H3CMLB12-EX.srv.huawei-3com.com>
In-Reply-To: <CEB9978CF3252343BE3C67AC9F0086A378D9A799@H3CMLB12-EX.srv.huawei-3com.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [90.186.0.117]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49b4f889-089b-4528-eb34-08d72b28cff5
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:CH2PR18MB3366; 
x-ms-traffictypediagnostic: CH2PR18MB3366:
x-microsoft-antispam-prvs: <CH2PR18MB336629AEB4D0FDE31413E6DDFCA00@CH2PR18MB3366.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(189003)(199004)(53936002)(2501003)(14454004)(118296001)(36756003)(229853002)(4326008)(6512007)(25786009)(6246003)(110136005)(54906003)(478600001)(476003)(102836004)(66446008)(486006)(6506007)(53546011)(66946007)(64756008)(66556008)(66476007)(76176011)(76116006)(14444005)(256004)(5660300002)(446003)(8676002)(91956017)(81156014)(81166006)(2616005)(11346002)(8936002)(26005)(2201001)(71190400001)(71200400001)(86362001)(6436002)(6486002)(2906002)(7736002)(99286004)(66066001)(3846002)(305945005)(6116002)(316002)(186003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3366;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VgDFfZJd/TNsiLnd2Yv2WeCGU6EnxYJOJX8bU6a01CjZDrdAC3p7c+gXMLvrXsAAPC1jDDQ6dbF6Rg+1LoCn1jn4lrCWufjHP+sUGXcXPrheYOpn2eTMdKbvzVM8ntTfTLGkKLuoPNy9DEJD24K6htszyRVuiUl92SXxO6e+YXKByvivNiar8Nj/VmOHI7s/gBnq0Ea8rBF9F+6cDxUrBbSUubbVqKGaiX4FhFqLU4VikRut/1Rr+PaCi94VqLbmE80Rxy4WdGNG6XvPWysvXocvhBLn4MSFhJzb/gKcTXzkIuYEJYagJBVvxURK9A4NSpZ04CscTQWcWG8wyc7yOAjWd0R1/ZpyJEW0dCHguNKM2qrLCxurHRLMlvZ6nEVn2AT7Vbg+imTrzafH1ot51dEPirlpJiM2PEboqL2f5Dw=
x-ms-exchange-transport-forked: True
Content-ID: <3E594772962A514FA6C5D74DCDE7BC88@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b4f889-089b-4528-eb34-08d72b28cff5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 19:57:38.1902 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DI4oVv/s0LQquL3u+jbei7IGhFrwUxlth5oO599r/9UvhxEFdegfzq/l65PHH1q4Jos50fO9Q5cIjtHknAdh0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3366
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.30]); Tue, 27 Aug 2019 19:58:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Tue, 27 Aug 2019 19:58:40 +0000 (UTC) for IP:'15.124.2.86'
	DOMAIN:'m4a0040g.houston.softwaregrp.com'
	HELO:'m4a0040g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.86
	m4a0040g.houston.softwaregrp.com 15.124.2.86
	m4a0040g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7RJwj9m005779
X-loop: dm-devel@redhat.com
Cc: "guozhonghua@h3c.com" <guozhonghua@h3c.com>,
	"changlimin@h3c.com" <changlimin@h3c.com>,
	"wang.yongD@h3c.com" <wang.yongD@h3c.com>,
	"zhang.guanghui@h3c.com" <zhang.guanghui@h3c.com>
Subject: Re: [dm-devel] [PATCH] multipathd: "san_path_err" failure
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Tue, 27 Aug 2019 19:59:13 +0000 (UTC)

On Tue, 2019-08-27 at 12:28 +0000, Chongyun Wu wrote:
> Hi Martin and Ben,
> 
> Cloud you help to view below patch, thanks.
> 
> From a7126e33e7eff8a985600b41b1723ee66b183586 Mon Sep 17 00:00:00
> 2001
> From: Chongyun Wu <wu.chongyun@h3c.com>
> Date: Tue, 27 Aug 2019 10:23:50 +0800
> Subject: [PATCH] multipathd: "san_path_err" failure optimization
> 
> Let san_path_err_recovery_time path unstable can be
> detected and not reinstate it until this path keep up in
> san_path_err_recovery_time. It will fix heavy IO delay
> caused by parts of paths state shaky in multipath device.
> 
> Test and result:
> Run up eth1 30s and down eth1 30s with 100 loops script to
> make some paths shaky in each multipath devices.
> Using below multipath.conf configure in defaults section:
>     san_path_err_recovery_time 30
>     san_path_err_threshold 2
>     san_path_err_forget_rate 6
> After test, not found any IO delay logs except several logs in the
> very
> beginning which before san_path_err filter shaky path works .
> If without above config and this patch there will be lots of IO delay
> in syslog and some paths state change from up to down again and
> again.
> 
> Signed-off-by: Chongyun Wu <wu.chongyun@h3c.com>
> ---
>  multipathd/main.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Hello Chongyun,

Your patch makes sense to me. Ben has worked much more than myself on
marginal paths recently, so I'd want to see his opinion, too.

Regards,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
