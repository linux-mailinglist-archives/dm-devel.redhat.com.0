Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BE1A1F23
	for <lists+dm-devel@lfdr.de>; Thu, 29 Aug 2019 17:29:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 60E5B3082E66;
	Thu, 29 Aug 2019 15:29:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AF1860872;
	Thu, 29 Aug 2019 15:28:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 688C71800B74;
	Thu, 29 Aug 2019 15:28:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7TFSdtw015436 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 29 Aug 2019 11:28:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9FA7060F82; Thu, 29 Aug 2019 15:28:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9603260E3E;
	Thu, 29 Aug 2019 15:28:39 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A89F82A09A7;
	Thu, 29 Aug 2019 15:28:27 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Thu, 29 Aug 2019 15:26:35 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Thu, 29 Aug 2019 15:24:14 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.8.13) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Thu, 29 Aug 2019 15:24:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=AlrudxcsN/kz8B2KAgbwKvz2cq4jIRcXk8swp2aGZJRrfCycjE5xO3KMr+lt9nir1zJVMxM5J2IAB46F7c753ob/QH2bBr0PQvnpJ6WHw7LBVqt4J4ySMUuaKBDStbxDKsHCmkIYQlpPTwDY6XKcep/gyymnKQ3iUJlcLcnFw1bns4Y1Eu2KpmlZUpXGmeRuI7BXtHt7Ql04iyf8XkDjIzQDwGJIkwUH+oEYi22HZ5YycQLQ5dCa3BxJ7chQBtB9krJ5eBdfsYPNZtJCJcp02YKYs+R2H0agjwiXW5zLG5IALcj6ZlyyDN2K7MJ/n3A0DC3cI4cOqhJJATRVWneraw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5zMr2QfMlG758UtuXvZ/zltGxCXoihomM/lfLP9NwfI=;
	b=fXE5Q02bJD9Eqy4bXbiDp42wRGx+ToB/YDhcMDU68UL4BN8CHB77RNGmXi2enwA5AWCgpLep6pEMELYfsmnVHBR1ZzJDkIzBbGgydxtQx5xPzns6sf6l/w1i7r/7FcF1j8xuqWHYzSWFZLCVX4mk8OtgXQpv0HKqiv66YqPORddrbd+N4JL7PAhnDHlXbN/Yk1AmNk9x/R/oNfHxDUD4XuUSk0eY2E/QjP9LdtEp+jZ13eYYTmUgh9OXXlnRUdlqoiXuRzF1HgwEhz12Ktp8CyYxuH2wYbmxWb7puOjH0Yn9pvMFt7JU049Qu4tXUzucFREubD6Ql+6IxwIc5fDvIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3413.namprd18.prod.outlook.com (52.132.247.16) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2199.21; Thu, 29 Aug 2019 15:24:07 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::650e:1c23:2bf1:fca8]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::650e:1c23:2bf1:fca8%6]) with mapi id 15.20.2199.021;
	Thu, 29 Aug 2019 15:24:07 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, "wu.chongyun@h3c.com" <wu.chongyun@h3c.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [dm-devel] [PATCH] multipathd: "san_path_err" failure
	optimization
Thread-Index: AQHVXRGtvZ+E65U/y0ej8kmnSjs4LacSQXYA
Date: Thu, 29 Aug 2019 15:24:07 +0000
Message-ID: <0a5e3a891eafe3efa950f4a1abfe3190143f8dcc.camel@suse.com>
References: <CEB9978CF3252343BE3C67AC9F0086A378D9A799@H3CMLB12-EX.srv.huawei-3com.com>
	<933edbd8794512cd35a48c596b36634b1bcd820c.camel@suse.com>
In-Reply-To: <933edbd8794512cd35a48c596b36634b1bcd820c.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [90.186.0.117]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d60b6356-2339-4337-1b11-08d72c94ef51
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3413; 
x-ms-traffictypediagnostic: CH2PR18MB3413:
x-microsoft-antispam-prvs: <CH2PR18MB3413522790CA24B062530B50FCA20@CH2PR18MB3413.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(199004)(189003)(478600001)(3846002)(316002)(2501003)(11346002)(186003)(118296001)(7736002)(446003)(305945005)(99286004)(6116002)(86362001)(76176011)(14454004)(2906002)(229853002)(486006)(66066001)(2201001)(476003)(2616005)(54906003)(110136005)(26005)(64756008)(6506007)(25786009)(14444005)(76116006)(91956017)(66446008)(256004)(66946007)(6246003)(102836004)(66556008)(53546011)(81156014)(81166006)(8676002)(66476007)(5660300002)(4326008)(6486002)(36756003)(71190400001)(8936002)(53936002)(71200400001)(6512007)(6436002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3413;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7vVkh/szEeX0omxZkAdx1oWaXJP2bg1+zLT5rlay+shi3GzK2YNXeD9Gix5br6xenKRb60uhxFEy1DCB40twFW+iZ+0oOz/aYSv6XcJzMdxnl9ejxh6YMuvzzQsR4Cawj2AUCcliDqkAB+n/lKPKou3b09L8Z3jwLxOQETap0MDmDTlLLPdwem58+FF0O34Az0s53HV7WtOC2Arezz83AyTKjoPPIEOCz7pEClIqlz2HpNUTeHYSuSZHBUVho85T3fHgENiPC671N4jTxKK8xW2rK5P4/qb8gob/NpZZaAdWEw4ocEXYfmsv1r6+4hDpjTcBnAXX++ilhqEuUro5kYS+BB1JfdJaJbWn0/e1UxNLrtf8n8opFoNxB0gbN1+m0vepyqsyyRgs/JuRFbTjWJR2bePA4shp9FuYf5BiFAA=
x-ms-exchange-transport-forked: True
Content-ID: <66D1F5B6A735C7488C41EE78508AEACD@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d60b6356-2339-4337-1b11-08d72c94ef51
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 15:24:07.6147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FCGKx+H7RXXLuvnK731XSiWCw0Oa3e7S+oCC+A740CeJr6WYmse18r7OmKS5LOdGg4PQVJcoDNdCMOxVPRl5Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3413
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.38]); Thu, 29 Aug 2019 15:28:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Thu, 29 Aug 2019 15:28:38 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7TFSdtw015436
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 29 Aug 2019 15:29:06 +0000 (UTC)

On Tue, 2019-08-27 at 19:57 +0000, Martin Wilck wrote:
> On Tue, 2019-08-27 at 12:28 +0000, Chongyun Wu wrote:
> > Hi Martin and Ben,
> > 
> > Cloud you help to view below patch, thanks.
> > 
> > From a7126e33e7eff8a985600b41b1723ee66b183586 Mon Sep 17 00:00:00
> > 2001
> > From: Chongyun Wu <wu.chongyun@h3c.com>
> > Date: Tue, 27 Aug 2019 10:23:50 +0800
> > Subject: [PATCH] multipathd: "san_path_err" failure optimization
> > 
> > Let san_path_err_recovery_time path unstable can be
> > detected and not reinstate it until this path keep up in
> > san_path_err_recovery_time. It will fix heavy IO delay
> > caused by parts of paths state shaky in multipath device.
> > 
> > Test and result:
> > Run up eth1 30s and down eth1 30s with 100 loops script to
> > make some paths shaky in each multipath devices.
> > Using below multipath.conf configure in defaults section:
> >     san_path_err_recovery_time 30
> >     san_path_err_threshold 2
> >     san_path_err_forget_rate 6
> > After test, not found any IO delay logs except several logs in the
> > very
> > beginning which before san_path_err filter shaky path works .
> > If without above config and this patch there will be lots of IO
> > delay
> > in syslog and some paths state change from up to down again and
> > again.
> > 
> > Signed-off-by: Chongyun Wu <wu.chongyun@h3c.com>
> > ---
> >  multipathd/main.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> 
> Hello Chongyun,
> 
> Your patch makes sense to me. Ben has worked much more than myself on
> marginal paths recently, so I'd want to see his opinion, too.

I've now tested this, and indeed it improves the behavior of the
san_path_err algorithm. It's also consistent with how delay_wait_checks
used to behave. So:

Reviewed-by: Martin Wilck <mwilck@suse.com>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
