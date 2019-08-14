Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 233A08E01C
	for <lists+dm-devel@lfdr.de>; Wed, 14 Aug 2019 23:45:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A7B7C0578FA;
	Wed, 14 Aug 2019 21:45:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B65765C29A;
	Wed, 14 Aug 2019 21:45:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9790718089C8;
	Wed, 14 Aug 2019 21:45:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7ELj9sG006910 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 17:45:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DAB4B1001281; Wed, 14 Aug 2019 21:45:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B5AE1001B03;
	Wed, 14 Aug 2019 21:45:06 +0000 (UTC)
Received: from m4a0040g.houston.softwaregrp.com
	(m4a0040g.houston.softwaregrp.com [15.124.2.86])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B7B4E64127;
	Wed, 14 Aug 2019 21:43:36 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0040g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 14 Aug 2019 21:43:15 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 14 Aug 2019 21:39:54 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.8.14) by
	M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 14 Aug 2019 21:39:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=jwNTahQZcuRVtUyLcsY3LZ1wcfkcQFBnYRM05SKNqk1DlUztKQIPRIlWYzbL6UUUODay1+ThNnXGtqgOIeYNnnNtUN7sXQFOVQhfjCMZGHEicXRFJrXGqieT51Xp3YmG3KtKO0VhpMQHOCOJqzW9EIoOrEGCjUyyIU8hqzXtz6e2BD1CA3p7F4pyIpl8L32IvT+b2qvCByuft2Y9a14pEvloP33kAy5Sj2ktbfx+ojO6m5FhQ5NMcsGR9CrKZMkYJ5XTBlAHIPRgeLoyOJMOtgrtBJi3K7D/Qcsm+dt3Yyyi5ZIYNsJohbzAM2Jsk51dELjAxdE5BxdSCjcDbjDw0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=vDyx38/umNov0CJSuhpLpGXVwj5wzVLLddMLAhXnvHQ=;
	b=kFwVgSMMfEAQwaMS9gZYijKkcapEQjo/vNIpwXsxDTzJsPlE1U8FZVK8zLHxeIzoYLa+XlgQAnFwXBt6mNZm+fBWGYtFvbQk/YqedXTTFAIUYv+ORnF53Q0FXjFYN4KjAY5dhnhlRF+9Z38ORJDrtCxDV36au7VafGZXUeTvA46Ex/3cndXPRZZdTnNJoRJIC9vDVFO/2+8pyCtH4StTV1FpMCdJLHxttVBoSFMCDLov/uiA23eIHETD/0y0gHKgD1RYgXwDkxOB0GBosSmrFgahc3NfC0N97CwzfOEoVW+EPxAdUhFhz8wT0RnxToXa/N57ftosZk/Q/XUaPOdM3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3431.namprd18.prod.outlook.com (52.132.245.140) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.14; Wed, 14 Aug 2019 21:39:52 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2157.022;
	Wed, 14 Aug 2019 21:39:52 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 05/16] libmultipath: fix double free in pgpolicyfn error
	paths
Thread-Index: AQHVUujb+XZpJIKrUEuKn3sfZTpQPQ==
Date: Wed, 14 Aug 2019 21:39:52 +0000
Message-ID: <eac4f53c801150b81a743f2f7218913d67a8cacc.camel@suse.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
	<1564763622-31752-6-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1564763622-31752-6-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76bdcf27-d9cf-4a74-c240-08d720fff0ec
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3431; 
x-ms-traffictypediagnostic: CH2PR18MB3431:
x-microsoft-antispam-prvs: <CH2PR18MB3431DEE05EBD52F567F844B8FCAD0@CH2PR18MB3431.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(199004)(189003)(11346002)(118296001)(3846002)(36756003)(66556008)(66476007)(102836004)(4326008)(64756008)(76116006)(66446008)(91956017)(25786009)(4744005)(186003)(446003)(26005)(476003)(5660300002)(86362001)(66946007)(81156014)(2616005)(2501003)(53936002)(6512007)(81166006)(486006)(8936002)(6506007)(99286004)(76176011)(14454004)(6486002)(305945005)(2906002)(8676002)(71200400001)(478600001)(54906003)(110136005)(6246003)(256004)(6436002)(229853002)(6116002)(71190400001)(316002)(7736002)(66066001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3431;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mMWjad8UHL5baQVFTIQWlc5k4CHjY9irSnSmV2VJcdY3YVd3zkR/5vjnVd76eQZvdjwKuO9EKWH0leOWkBv3jaQoznjyqQ93KX8wa3szvKC+c5MbBcFLKbKgwAyr4c/XRV9X05q5H7hW3ElVuKXz8VHwwrk0QyCFEUsW5NTBFAkth6z8qO36gkmXs+7Etjl1pm8xmfRqzDiA3KbKNV7HmYtQzBhwe1yVvL90I06DQvArp27NqAvI7DX8U2fVAYImcf9pYlUn3pEYIaotAm6QtWtDoagTD1fzpl3iA1WEy6oEegCaBSc4eJK7P9VlJRWaOoYApaiDsNElP/HtT2qR5eVeNoqRkOyrGwbIpX/aHZjRQz2mlkB9c7muJnq3+w82OstBa5jcZ1/58aHKaxyshUDFQpdHgaOeO9anGRK+FWo=
x-ms-exchange-transport-forked: True
Content-ID: <77904F945B953F479426852A92D1F0FE@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 76bdcf27-d9cf-4a74-c240-08d720fff0ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 21:39:52.5642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PhSrQQQ3Xqk60bAFmOuxehkvjIH6cWOC5vpWmZbflr37y9EHmK57bX97DNqG7xcU/CiQIS66d/lWkkATw01RpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3431
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Wed, 14 Aug 2019 21:45:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Wed, 14 Aug 2019 21:45:05 +0000 (UTC) for IP:'15.124.2.86'
	DOMAIN:'m4a0040g.houston.softwaregrp.com'
	HELO:'m4a0040g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.86
	m4a0040g.houston.softwaregrp.com 15.124.2.86
	m4a0040g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7ELj9sG006910
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mkumar@redhat.com" <mkumar@redhat.com>
Subject: Re: [dm-devel] [PATCH 05/16] libmultipath: fix double free in
 pgpolicyfn error paths
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Wed, 14 Aug 2019 21:45:34 +0000 (UTC)

On Fri, 2019-08-02 at 11:33 -0500, Benjamin Marzinski wrote:
> In the pgpolicy functions, if an error is encountered after
> alloc_pathgroup() is called, but before the path group is added to a
> multipath device with add_pathgroup(), the pathgroup needs to be
> cleaned
> up by calling free_pathgroup(). However, after the pathgroup has been
> added to the multipath device, calling free_pgvec() will clean it up.
> In
> this case, if free_pathgroup() is called first, the recently added
> pathgroup will be freed twice.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

Reviewed-by: Martin Wilck <mwilck@suse.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
