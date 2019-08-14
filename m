Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 085EC8DFC2
	for <lists+dm-devel@lfdr.de>; Wed, 14 Aug 2019 23:28:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 604459B290;
	Wed, 14 Aug 2019 21:28:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AE7A40EF5;
	Wed, 14 Aug 2019 21:28:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 510E91806B00;
	Wed, 14 Aug 2019 21:28:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7ELPGEb006218 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 17:25:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9BBAB81C0C; Wed, 14 Aug 2019 21:25:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5720E60605;
	Wed, 14 Aug 2019 21:25:14 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4A12030A00FE;
	Wed, 14 Aug 2019 21:25:06 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 14 Aug 2019 21:24:39 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 14 Aug 2019 21:20:48 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.8.14) by
	M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 14 Aug 2019 21:20:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=g2n/r5EYIPyKE30Oit2L1L9UE6EOkT05dMmGWNkBFt+7DLerFob+H3MZ63E6Ow2aeymQi85hdUwhEzOEzS/vUilk/u1mT6o+5H4nLn+W9j32WPAR5s7zDs+PMXPTLQoF6TkMKWRbMSZA2vclodVGh1QpI4DPqJL9+B48Q6i57hdtiaVb5hh8QNRIEaUYnJ69boIaPcPqMxocbiy65YvIXZDVm79+lp5Q2zXE1c/TVcl2cdoebm/CTEo2H4Xis52ZpjdX+VpCr4BKrphwsbj6txIdsTOjEMEqdDJcpTF2s8IXAb8CMdxPPOIzzzKyK2jf7saV6v6GL11p+cQI4u+Nbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=8RfQQ+0jRWaS/7y0P/46YXBwnsMDfM++VKFIaDWE8bI=;
	b=CqQq93UfSYtEFoRxytAbl4WSizyBLClz22O9vw61+Sc6wz05dsVamwj25v7XGfoXfHFXtM6wc/KvnIzp3E3lq8Ai1rM4Stz8OlRzUMZL3ct26AfCj3CYx1rtIQRSX+6PFwL0T08NGVYyoBpOSVm0c4jBpgAtG4LcN9XDcNFPAtC0f7cZDQ9PwTRLoCSrl02OMrayoKnFDihTemb3PgI2zGFIChW4niJiKV0Xrp/qDDjI8Gjp88pmoTHpjIY7vOxlS7o/rZ5wN7fQIwE7QAXuYUczOTW61FPnPzcPZZ6+wYVKDKuujdTHY7Rb7rjxXrq+faldB306MB16sGq6TEiJuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3256.namprd18.prod.outlook.com (52.132.245.94) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.14; Wed, 14 Aug 2019 21:20:46 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2157.022;
	Wed, 14 Aug 2019 21:20:46 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 14/16] libmutipath: deprecate delay_*_checks
Thread-Index: AQHVUuYj+ZROPdedPEmqdyGz2nek3w==
Date: Wed, 14 Aug 2019 21:20:46 +0000
Message-ID: <af2c96e14df9aad64dbeded65e6e0c02c9ff45cf.camel@suse.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
	<1564763622-31752-15-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1564763622-31752-15-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9d1fa17-dee6-4db1-35d0-08d720fd45eb
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3256; 
x-ms-traffictypediagnostic: CH2PR18MB3256:
x-microsoft-antispam-prvs: <CH2PR18MB3256CC90067CEB8A305182FEFCAD0@CH2PR18MB3256.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(199004)(189003)(71190400001)(53936002)(229853002)(5660300002)(64756008)(71200400001)(6486002)(81166006)(478600001)(81156014)(99286004)(6512007)(118296001)(110136005)(316002)(66476007)(66446008)(76116006)(86362001)(2906002)(66946007)(91956017)(6246003)(54906003)(66556008)(6436002)(8936002)(36756003)(256004)(26005)(7736002)(4326008)(446003)(14444005)(305945005)(25786009)(14454004)(6506007)(66066001)(8676002)(2501003)(3846002)(102836004)(76176011)(186003)(6116002)(2616005)(476003)(486006)(11346002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3256;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mHv8hA7AxXvlyCUtTT94oMwyNBwJUja9UphKXzMnZmEL+OU4vw9E+wzp+KVlyxmX5poB1O0+aipZSli73dZ7mgBYLtYWSZsJb84iusHS4uHXr4VcWNx88nLjU7LcAdIXODZ12RTJS/OGz1LgYpGCJ7e2upBy7S7KV4XJvuus1LRSpPsOBzdTZ8Iexa1qNa1AcM8ca+zO0R4pefrarBu6/6hIEsr5kzhAIxJDKQYHe05JqlkrDgI7S1c9FNU1UAVVclCdX06aep2IESpgg0NHOGM3FOULgMhGGvNp/bv2xVbkjc6cQ6nJWQdj97YZRjQqSk5adYUqFVt+dm0W51/Mq9vkemyD9F6KO1A7el3/x6YoxJTYaxZ2XHNlCQ/kTMldQbFR+ipi+772/hwDn8s2GOlh3tfN0sCZpQLQ+QXuwJo=
x-ms-exchange-transport-forked: True
Content-ID: <8C87C81792E4F749AAB7A5E637BF26B4@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d1fa17-dee6-4db1-35d0-08d720fd45eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 21:20:46.6093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zy1S0LNoiGEaVHUPhSGE1w+AYQtEL/6BvykZgcREQeLxXsYfPhNRMOMG5UtrziPz0liMwY++zdxrpiQB1Iji/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3256
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Wed, 14 Aug 2019 21:25:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Wed, 14 Aug 2019 21:25:13 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7ELPGEb006218
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Wed, 14 Aug 2019 21:28:31 +0000 (UTC)

On Fri, 2019-08-02 at 11:33 -0500, Benjamin Marzinski wrote:
> The delay_checks shaky paths detection method works the same way as
> the
> san_path_err method, but not as well, with less configurability, and
> with the code spread all over check_path(). The only real difference
> is
> that marks the path as marginal for a certain number of path checks
> instead of for a specific time. This patch deprecates the
> delay_checks
> method and maps it to the the san_path_err method.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/configure.c   | 17 +----------
>  libmultipath/propsel.c     | 62 +++++++++++++++++++++++++++++-------

I suppose that quite a few users are working with "delay_*_checks" in
production. If we remove the option, we should at least clearly
document how to map existing delay_*_checks parameters to san_path_err*
parameters.

IIUC, to (roughly) imitate the settings

  delay_watch_checks = C
  delay_wait_checks = W

I need to set

  san_path_err_threshold = 2
  san_path_err_forget_rate = C
  san_path_err_recovery_time = W

Correct? Or can it be done better?

(It's not exactly the same, as delay_watch_checks starts counting when
a path is reinstated after a failure, while san_path_err_threshold
counts good->bad transitions, and the threshold would be reached if a
path fails more often than every C ticks _on average_).

If the above is fine, we might as well map these settings in the code
directly. IOW, instead of ignoring "delay_*_checks" altogether, we
should ignore it only if either san_path_* or marginal_path_*
parameters are set; Otherwise, we could simply map the delay_*_checks
parameters as shown above.

That would be a bit more user friendly in terms of backwards
compatibility.

Regards
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
