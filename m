Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id DE584240214
	for <lists+dm-devel@lfdr.de>; Mon, 10 Aug 2020 08:48:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-Fe0QrCFWPfC4AyP_DR4vag-1; Mon, 10 Aug 2020 02:47:52 -0400
X-MC-Unique: Fe0QrCFWPfC4AyP_DR4vag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E68F100A8E7;
	Mon, 10 Aug 2020 06:47:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 523FC1002388;
	Mon, 10 Aug 2020 06:47:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C71A1809554;
	Mon, 10 Aug 2020 06:47:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07A4Ybam017956 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 00:34:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7081610064FB; Mon, 10 Aug 2020 04:34:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 611341004023
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 04:34:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 598568007D1
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 04:34:35 +0000 (UTC)
Received: from act-MTAout1.csiro.au (act-mtaout1.csiro.au [150.229.7.37])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-400-XtkQ9LlKNEG9yM84VUp4jA-1; Mon, 10 Aug 2020 00:34:32 -0400
X-MC-Unique: XtkQ9LlKNEG9yM84VUp4jA-1
IronPort-SDR: mK+FfGGzMGvT23rKoomfVTpUjOLQjMeXhhApPU1M6NXUdcAuCYXtPkufxcrxdOaqFOUhd2F1s3
	ikJrBRn4vY5g==
X-SBRS: 5.1
IronPort-PHdr: =?us-ascii?q?9a23=3AiCGWOBR+j0cGiYDP0eq0LLuM8Npsv++ubAcI9p?=
	=?us-ascii?q?oqja5Pea2//pPkeVbS/uhpkESQBNiJ8f9Ii+PK9avnXD9I7ZWAtSUEd5pBH1?=
	=?us-ascii?q?8AhN4NlgMtSMiCFQXgLfHsYiB7eaYKVFJs83yhd0QAHsH4ag7Ir3Gy5CJUER?=
	=?us-ascii?q?L6ZkJ5I+3vEdvUiMK6n+m555zUZVBOgzywKbN/JRm7t0PfrM4T1IB5K7w2jB?=
	=?us-ascii?q?LU8XY=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A+E0AgCFzTBflwCwBSSYiIBxAISUgiN?=
	=?us-ascii?q?ggQmBSoFSUWKBRwqELINGA6kLA1ULAQEBDAItAgQBAQKEY4IgAiQ3Bg4CAwE?=
	=?us-ascii?q?BCwEBBgEBAQEBBgQCAhABAQEBAR4GhgwBC4NTgQMBAQEBAQEBAQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQEBAQEBAQEBAQEBAQEBAQEFAoEMVhERDAEBOBEBIgImAgQSHhUSBDW?=
	=?us-ascii?q?DBIJMAy0BAQSnJAKBOYhgAQF1gTKDAQEBBYVDGIIOCQkBgQQqgnCDX4ZAgVw?=
	=?us-ascii?q?+gRGHfIMmgmCSf6MrBwMggkIEj2mKHQINIaASki6fNAIEAgQFAg4BAQWBaU+?=
	=?us-ascii?q?BLWyDPVAXAg2OOYNXilZ0NwIGCAEBAwl8jUuBMwGBEAEB?=
X-IPAS-Result: =?us-ascii?q?A+E0AgCFzTBflwCwBSSYiIBxAISUgiNggQmBSoFSUWKBR?=
	=?us-ascii?q?wqELINGA6kLA1ULAQEBDAItAgQBAQKEY4IgAiQ3Bg4CAwEBCwEBBgEBAQEBB?=
	=?us-ascii?q?gQCAhABAQEBAR4GhgwBC4NTgQMBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQEBAQEBAQEFAoEMVhERDAEBOBEBIgImAgQSHhUSBDWDBIJMAy0BAQSnJ?=
	=?us-ascii?q?AKBOYhgAQF1gTKDAQEBBYVDGIIOCQkBgQQqgnCDX4ZAgVw+gRGHfIMmgmCSf?=
	=?us-ascii?q?6MrBwMggkIEj2mKHQINIaASki6fNAIEAgQFAg4BAQWBaU+BLWyDPVAXAg2OO?=
	=?us-ascii?q?YNXilZ0NwIGCAEBAwl8jUuBMwGBEAEB?=
Received: from exch3-mel.nexus.csiro.au ([IPv6:2405:b000:302:71::85:123])
	by act-ironport-int.csiro.au with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
	10 Aug 2020 14:33:21 +1000
Received: from exch4-mel.nexus.csiro.au (2405:b000:302:71::85:124) by
	exch3-mel.nexus.csiro.au (2405:b000:302:71::85:123) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Mon, 10 Aug 2020 14:33:21 +1000
Received: from exedge2.csiro.au (150.229.64.34) by exch4-mel.nexus.csiro.au
	(138.194.85.124) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via
	Frontend Transport; Mon, 10 Aug 2020 14:33:21 +1000
Received: from AUS01-SY3-obe.outbound.protection.outlook.com (104.47.117.54)
	by exedge2.csiro.au (150.229.64.34) with Microsoft SMTP Server (TLS) id
	15.0.1497.2; Mon, 10 Aug 2020 14:33:13 +1000
Received: from MEAPR01MB4517.ausprd01.prod.outlook.com (2603:10c6:220:3c::18)
	by MEAPR01MB3560.ausprd01.prod.outlook.com (2603:10c6:220:1::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.21;
	Mon, 10 Aug 2020 04:33:19 +0000
Received: from MEAPR01MB4517.ausprd01.prod.outlook.com
	([fe80::80c9:72d0:91b9:8d4e]) by
	MEAPR01MB4517.ausprd01.prod.outlook.com
	([fe80::80c9:72d0:91b9:8d4e%7]) with mapi id 15.20.3261.022;
	Mon, 10 Aug 2020 04:33:19 +0000
From: "McIntyre, Vincent (CASS, Marsfield)" <Vincent.Mcintyre@csiro.au>
To: "dm-devel@redhat.com" <dm-devel@redhat.com>
Thread-Topic: Promise and ALUA
Thread-Index: AQHWbs9fDNrw4OuErkeBUsladbntRg==
Date: Mon, 10 Aug 2020 04:33:19 +0000
Message-ID: <20200810043316.GH21810@mayhem.atnf.CSIRO.AU>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [130.155.194.144]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c619c2a6-9425-41de-640b-08d83ce68206
x-ms-traffictypediagnostic: MEAPR01MB3560:
x-microsoft-antispam-prvs: <MEAPR01MB356065E6CA9F860781C7BC40F4440@MEAPR01MB3560.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jj+QGI849XwYaSsiNsSphFCBSO5ttY7ihnS7IXUM1mpFDlW0ISm7+XBo05bKs0Qc2x+gxhj0aK+etbWOP49amILyV5efkBHYFx23cwtVdCFeh4F3NrQsElBtvXKa1YBSV0cjuBld4uS7ulZsW19qJfpKOVbN84msobKi1ouEQrYpcogRxvJwMOLwzSnEXwtBn9hnTnfiC3loadFqjshkYeMciozDhB8pmF3WGhBju59s6UkqXWHi6FF2POx02h85uagw52vus/UMQRPFbE2BEfrSN73UM3sdeJ5Cy29cowrowEpruESJHFs7V8UQIqaNfmTV1btKF9Iqnep3E+x4aQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MEAPR01MB4517.ausprd01.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(76116006)(5660300002)(91956017)(86362001)(66946007)(66476007)(66446008)(64756008)(66556008)(1076003)(71200400001)(8676002)(6512007)(6916009)(316002)(3480700007)(7116003)(6486002)(8936002)(478600001)(186003)(83380400001)(26005)(33656002)(2906002)(6506007);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: MY90Oe7OUShdrokOxPIng1zO7FALn0Kcuw8CiU1+MmNGTcOAis7evgTa3DIuIj/Cbll5oFkD0ftGjNZKq8FGSE7SBsSYWVsAwbbknwfh5dBZGLPyv2LIYQKVr7xbn25yqPaZMUkZUEDG3ce0NgdSH8OhBop+H8WnrIQLrgeh0MWMdpfq09YC8MzD3qeM9oNVANNoVo+JKTHJ+wnPzoBaHhp4hFPoKsBpZmI69tT2bcxRN98tXGZJAijaaH1eec1LZByXI7msm6Aqw2nKxSBd7XWhOyPxh947uZkYKekecXKHaUVREQWD7gWwLc446/4NkZq5rh5tYq4qYQxfsoTGxEVKUbZSd7Pw0Yd0Wzc/CfWfKQnXrMnqqJLEGMu/moyz6WY36K9X9xLWz/ilDND9Yc17OIFoM0+ttVZXO85AR/eLIVHFOPOPGOG/SEpw/18B7tp3B4GIBOXx9L0wmhXQ9oNhfmb/ZiDpGUJ4Rl4WkZEAOkCpTVaLzataWmGa7M+Z+tktPNZAeBAleDRD9bb2NNf0D/tAjjrF+QYcOXdUgcXK8xTXju/tkDuLrVeX9DZ0hgTxF0s7iF6fqTm6wxjcfk3lMA6pJQXTqtYFZq9MHsYcHve8K6hW8ezxKqLoo4oOYmP/7y4xhFhOfAi+pocvDQ==
x-ms-exchange-transport-forked: True
Content-ID: <F8C563E331AF08459814C34E740E7633@ausprd01.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MEAPR01MB4517.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c619c2a6-9425-41de-640b-08d83ce68206
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2020 04:33:19.4047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0fe05593-19ac-4f98-adbf-0375fce7f160
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FmmKvTScUFP/rqrigEKgxcBNuKoT9un/dyzzvYhWZ8naAHZDgnX6Ao5vXXNRJoac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEAPR01MB3560
X-OriginatorOrg: csiro.au
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07A4Ybam017956
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 10 Aug 2020 02:47:26 -0400
Subject: [dm-devel] Promise and ALUA
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

for many years we have been operating some Promise VTrak arrays
without any use of the ALUA feature (largely so we don't have to
specify LUN affinities as well, which seems to be required).

In the process of upgrading to Debian Buster
(multipath-tools 0.7.9 and kernel 4.19)
I find that I can no longer connect to our Promise arrays.
They are detected but the only useful output I get is

 multipathd[986]: reconfigure (operator)
 multipathd[986]: sdc: alua not supported
 multipathd[986]: sdd: alua not supported
 multipathd[986]: sdr: alua not supported
 multipathd[986]: sde: alua not supported
 multipathd[986]: sdf: alua not supported
 multipathd[986]: sdg: alua not supported
 multipathd[986]: sdh: alua not supported
 multipathd[986]: sdi: alua not supported


I found the note in the manpage about alua being selected by
default for these arrays[1], but I'm taken aback that I'm not
allowed to override this.

Is there really no support any more for choosing whether to use
ALUA or not?

I have tried messing about with detect_prio, dectect_checker
and whatnot, to no avail.

Kind regards
Vince

[1] 9b5ea2eda85ae072cb697310807611c693713c2b
    libmultipath: retain_attached_hw_handler obsolete with 4.3+

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

