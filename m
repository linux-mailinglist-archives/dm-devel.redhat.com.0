Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DB34A8DFE0
	for <lists+dm-devel@lfdr.de>; Wed, 14 Aug 2019 23:31:37 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5D9F52145;
	Wed, 14 Aug 2019 21:31:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E7F67B6FC;
	Wed, 14 Aug 2019 21:31:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3CC0D18089C8;
	Wed, 14 Aug 2019 21:31:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7ELVC3Y006485 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 17:31:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6116383798; Wed, 14 Aug 2019 21:31:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EEAB8308A;
	Wed, 14 Aug 2019 21:31:10 +0000 (UTC)
Received: from m9a0001g.houston.softwaregrp.com
	(m9a0001g.houston.softwaregrp.com [15.124.64.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 338BEC0495A3;
	Wed, 14 Aug 2019 21:31:04 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0001g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 14 Aug 2019 21:30:43 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 14 Aug 2019 21:27:50 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 14 Aug 2019 21:27:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=hxHHTiLkORyfHTGcx6OSFoTxeHPHDnQpHdHsNxrDSA/zmqpgfkkET8dJsyWAI1WiJHX9RQFSk6nfHRaIUP01/d0WwUXkhA/doU8IYjFgblzMusHLbg8c95msM1Cne5nQWSbHlM6Ve7mfCLDti2OyIqcKgar4+nZxzCgY0dAEkm6pZcL/pZTC7uR8Vb+bGRYSGlQuOMt+DRsdiZ9X421UyJwO5FRIOh4NO9sT6seFv8nkKb+IQ5+ja9JRdTqYKVAmKq73vcD/9HCQxoL5FJGFpgi32dbonoaidAl536UV791EqKnvcpKvma9AdjZlbJtqdK0SBBlr3TtLZzQQ7ZMRgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=nZnbqMXPeM52W24AsLogdAa1XSRFtcL/w0YhlvbV2AY=;
	b=b515WDb5v8eRj4dtv3bLopJ6b44bCo6nX7AYvhQA5jbzDY2WnP1ckT8Vj6uOaaz2L7vxcfmc7+Hazqe49qsAnoZlrMMiZlAb0Kf4/ZWnevSmfnNtgeS43U5GdpIAYn2KLaTn7y2nl4EPKEQLXtOb2jPv+WxnMmBGzKB8lXR+ULeMPW1M9JgHhNNM9MEVe2iyaWFpNf3EJO8tJVF0ozyrRhaNBwHhgWj9I2ulqYnlvimDaiBGOHwX38+1hTkbjoPVJTXCtxYlYhrtUfoBCGgN0LLHvapK2iwKNWHXsayu2sP/YRF9Wzu6gQ4EJNI6XpYDjgW6xdk5ZYFm2G+pzoazvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3430.namprd18.prod.outlook.com (52.132.246.206) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.14; Wed, 14 Aug 2019 21:27:49 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2157.022;
	Wed, 14 Aug 2019 21:27:49 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [dm-devel] [PATCH] multipath: add print_foreign option
Thread-Index: AQHVUucfvfCQPKhkM0Wrmzw97wFXLQ==
Date: Wed, 14 Aug 2019 21:27:49 +0000
Message-ID: <e81dedea972b6471cc2fd9b8ae0660c06b766b43.camel@suse.com>
References: <1565803320-6996-1-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1565803320-6996-1-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39403bfe-9455-4861-36ad-08d720fe41ca
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3430; 
x-ms-traffictypediagnostic: CH2PR18MB3430:
x-microsoft-antispam-prvs: <CH2PR18MB3430FA2F421271C76137EAF2FCAD0@CH2PR18MB3430.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(189003)(199004)(6246003)(305945005)(7736002)(14454004)(256004)(102836004)(4326008)(26005)(186003)(2501003)(11346002)(6506007)(446003)(486006)(2616005)(476003)(25786009)(8676002)(6116002)(76176011)(66066001)(3846002)(118296001)(81156014)(478600001)(6512007)(64756008)(53936002)(71190400001)(71200400001)(110136005)(66556008)(81166006)(66476007)(6486002)(6436002)(2906002)(36756003)(86362001)(66946007)(8936002)(91956017)(76116006)(66446008)(316002)(99286004)(5660300002)(229853002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3430;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tHv3G5pLe9O+hlwZu//qZ3jHsQF7zpJ9EIJCVzvVDYo4qGFNNXNkruZoh0GT5YBt9YM4dvS3SuEK6cDR12bE9JBTk4SjzG+bXoODijCebpMlib/zHyYO+HRAe/s8Z8fJOwY8Tesx45VnWoDEz4ApI8NLtWspaiBNrit6NSH0H2xdUDNavANMwDotg4SrSRAhJHiNuaOYc9MI8vByfnyEYXkfPIin53M0+2GfUWgBP5RndN6jBRAAsJUSI7BipQ0nQWSxyXsgLKLPFtWA7DWLmSaIj5rPblGDirP4c6z8TnBj2GCMR57f5vswmPLmx69L6ltPAdD24hdSY3ZDzMiihgbGDi7AI9wWFeDhJLFkEzhSsG9HgvJRNTAZBqlEIEUfrZcdCq/ROvJc8lCEBzAH4tFb9GPAFgyzXRh3Jj4rmSI=
x-ms-exchange-transport-forked: True
Content-ID: <EA6F3C3E3A0D1C4EBFAE487B1AE3F2BC@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 39403bfe-9455-4861-36ad-08d720fe41ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 21:27:49.1868 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VxYhzg6Cpi3dmva604/QfbfsVWK2IZwbx++w4vAyDwGbiESlJTg8Gub8xpYYZxAzUdgJ7LjabJFNBT4gfE33dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3430
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Wed, 14 Aug 2019 21:31:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Wed, 14 Aug 2019 21:31:09 +0000 (UTC) for IP:'15.124.64.66'
	DOMAIN:'m9a0001g.houston.softwaregrp.com'
	HELO:'m9a0001g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.66
	m9a0001g.houston.softwaregrp.com 15.124.64.66
	m9a0001g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7ELVC3Y006485
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] multipath: add print_foreign option
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Wed, 14 Aug 2019 21:31:36 +0000 (UTC)

On Wed, 2019-08-14 at 12:22 -0500, Benjamin Marzinski wrote:
> This adds a print_foreign multipath.conf defaults option, that allows
> users to disable printing foreign devices and paths. It defaults to
> "yes".
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/config.c      |  1 +
>  libmultipath/config.h      |  1 +
>  libmultipath/defaults.h    |  1 +
>  libmultipath/dict.c        |  4 ++++
>  multipath/main.c           |  4 ++--
>  multipath/multipath.conf.5 | 12 ++++++++++++
>  multipathd/cli_handlers.c  | 40 ++++++++++++++++++++++++++++++----
> ----
>  7 files changed, 53 insertions(+), 10 deletions(-)
> 

The general idea is good, and has been requested from SUSE, too.

But, as "foreign" is designed to be generic and different foreign
libraries might be possible in the future, I'd like to this a bit
differently:

    enable_foreign = "$REGEXP"

Where REGEXP would be used to match the foreign library names.
The default value of REGEXP would be ".*" or "nvme". Users who want
to disable printing foreign maps would set it e.g. to "^$", or "NONE".

I'll send a patch soon.

Regards,
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
