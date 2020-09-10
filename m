Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id AB92D2685C4
	for <lists+dm-devel@lfdr.de>; Mon, 14 Sep 2020 09:25:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-__M00keOOC2HA0BdRZSz1w-1; Mon, 14 Sep 2020 03:24:53 -0400
X-MC-Unique: __M00keOOC2HA0BdRZSz1w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93472425DE;
	Mon, 14 Sep 2020 07:24:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 710617EEC9;
	Mon, 14 Sep 2020 07:24:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2ABFB1832FDE;
	Mon, 14 Sep 2020 07:24:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08A8Patg008550 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 04:25:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0DB971111C6D; Thu, 10 Sep 2020 08:25:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 073F91111C6C
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 08:25:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4A55906386
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 08:25:33 +0000 (UTC)
Received: from esa3.microchip.iphmx.com (esa3.microchip.iphmx.com
	[68.232.153.233]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-162-R9Xisao9OGS6aG9IjsB81A-1; Thu, 10 Sep 2020 04:25:31 -0400
X-MC-Unique: R9Xisao9OGS6aG9IjsB81A-1
IronPort-SDR: ftLnKVJWWVARs6xE60k80lvcWvEF9LnNReTXi2pIeHcFd1pOvCbq5YtWKyNQKbgntoF3PJrEzZ
	yGkW+CSPkTanXwFzN+yaXQvli7N+J9TDXD7EYbxy0puKvjPuscpCKfJznonLOJ1RssHzyGXWld
	FEmXkljrjgcGdATyyJ52ywdn6YOedSeAiw39Unb2/iAlFSlX4xOSaPEQ1oDzJo6jB0orKUYHob
	8TPZOmriiXyQ/YsxyXR92KLsMxoOl9I7rBMGKN1j5VU4WXWSblm45hfVc18o3BtgyAUNaPQFAh
	yGo=
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; d="scan'208";a="91279822"
Received: from smtpout.microchip.com (HELO email.microchip.com)
	([198.175.253.82])
	by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
	10 Sep 2020 01:24:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
	chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1979.3; Thu, 10 Sep 2020 01:24:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
	email.microchip.com (10.10.87.152) with Microsoft SMTP Server
	(version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
	via Frontend Transport; Thu, 10 Sep 2020 01:24:22 -0700
Received: from BYAPR11MB3477.namprd11.prod.outlook.com (2603:10b6:a03:7c::28)
	by BY5PR11MB4307.namprd11.prod.outlook.com (2603:10b6:a03:1bd::27)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16;
	Thu, 10 Sep 2020 08:24:22 +0000
Received: from BYAPR11MB3477.namprd11.prod.outlook.com
	([fe80::d1dd:de76:4e99:7c85]) by
	BYAPR11MB3477.namprd11.prod.outlook.com
	([fe80::d1dd:de76:4e99:7c85%7]) with mapi id 15.20.3348.019;
	Thu, 10 Sep 2020 08:24:21 +0000
From: <Nicolas.Ferre@microchip.com>
To: <joe@perches.com>, <linux-kernel@vger.kernel.org>, <trivial@kernel.org>
Thread-Topic: [trivial PATCH] treewide: Convert switch/case fallthrough; to
	break;
Thread-Index: AQHWh0vIy44IYF5A+kuaVLhVJ6ZdVw==
Date: Thu, 10 Sep 2020 08:24:21 +0000
Message-ID: <c2929349-ca60-486d-3cad-a83321587c5f@microchip.com>
References: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
In-Reply-To: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
x-originating-ip: [2a01:cb1c:8c:b200:d11f:426b:f805:cbe2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e351a690-85b8-47aa-f38f-08d85562eb8c
x-ms-traffictypediagnostic: BY5PR11MB4307:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4307E000D4DA0597A74F9A31E0270@BY5PR11MB4307.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rwdyTK6oNx+pJXY+VYO8jlUUcB5LsJW3ZQhau0YhpysDI1uZrWJ+5KkXmnJNABVwRpL8mxf24YLlXWyB3yirjaXQ/srQXMAk73DmLRMX7FFSd/uWs59kXpR0gz7YIDZpkdEHXR8Ks47+GSWaldjUxHW1dDgr9Bml1Ile+LfAjDi5j/2WavAN5DcmiJhVV86brSYApECTF1sqFMiIoIfargGWcDiXjLp0xoZy1wTF5cYKXSjd2DGvBQRASj+UAeO1Pg9WFEX+2sgdqqFJ/HgGUzu9uaOU20bpHBTTwQw7yoVGql5DTXE+Xr30INsHw1gSuTyHpcI3KtFhJi6QDKEIl6ZhO0EwhNcia52tqGsvyefiqtKNAZSsmZhN9N/OPaNO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BYAPR11MB3477.namprd11.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(136003)(376002)(346002)(396003)(366004)(39860400002)(36756003)(6506007)(4744005)(53546011)(31686004)(4326008)(8676002)(31696002)(6512007)(186003)(478600001)(2616005)(107886003)(83380400001)(54906003)(110136005)(5660300002)(316002)(2906002)(6486002)(76116006)(71200400001)(91956017)(66476007)(66556008)(8936002)(66446008)(66946007)(64756008)(7416002)(7406005)(86362001)(43740500002);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: CK3jnFjP+DaxTGoKSfijNwQSDSi+zYRAANKGWEe0w6BHoCBr3jeo8QFCPrdi+OpT1qz3lmVs3mCRxOmBtUGK5WN0AxOt0wvA3bBJRUyjBicAE+lDMsP7vy1cft0wcXBrEZgdgqF7VD1sQj+khtUTD5EsNnntahNSIGqwN+VZCKQ1QzjPtAbjR2oPP/LrPDKYk//qfKAomMDI7R2fpR0tTUzDMz48DEh+PQCCmr/krCP8U3KTB6FIGhilgI7TLOfsJcLS9qlGh0PGNeVy7GIerGvFEQfkR4YdlzVLyEKvYmf4EXR5wArGM6eS5MMbLL4vYVjGrhiNaJt+earGuTqyYiFZbc+uujPQG9qCWcGOhC7tSaJvV/BIkb7lV8g/yXvxSbayqkCXQ/s7jX+D9fM+ZWNqgoWbSd/P+uuCP7/8e33PXHOet1lAM1sUIHpLxk8RCyecYucN6ijlgMa8IdFcV7U+ZA3zH97/7OWVEtd6OgF0CR21Hki2raxtlS5sca+cVURYu2gcHFAMLULSgaOruMk5qcKurGsgOTL9NDY1H7Jpn1+7gJ+bMQIt2b5OxDFW2nSizeQSfqlNFoprGc6aS71OSv+MwkoEfhBi640q5sGrdYfhliWNj5HhbdiTLJVy1TBmrhSIzi6KODxmStaMlQzfe8a1Otv3042csYwXaPKEPC9i6WiYuHbWrvEwzSbxIsAABeXwAiTaxYC040N9rw==
Content-ID: <0B2726412C35D14B94E876CA5EB14904@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3477.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e351a690-85b8-47aa-f38f-08d85562eb8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2020 08:24:21.4887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JW3oElxXZwEvl6R2z5GFIVkcX/+UpGKsEW8MKFxofB9W1y9KDMUkM69WnQUZrCOB/0mudh2ADBhfj0C34gWZhgepCXhZk3LC9prwi+CGg3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4307
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08A8Patg008550
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 14 Sep 2020 03:23:33 -0400
Cc: linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org,
	oss-drivers@netronome.com, nouveau@lists.freedesktop.org,
	alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
	linux-ide@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
	sparclinux@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
	linux-rtc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, dccp@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
	linux-afs@lists.infradead.org, Ludovic.Desroches@microchip.com,
	coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
	linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
	linux-mmc@vger.kernel.org, kees.cook@canonical.com,
	linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, linux-sctp@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-nvme@lists.infradead.org, storagedev@microchip.com,
	ceph-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-nfs@vger.kernel.org, linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	ndesaulniers@google.com, linux-mips@vger.kernel.org,
	iommu@lists.linux-foundation.org,
	netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
	Eugen.Hristev@microchip.com, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [dm-devel] [trivial PATCH] treewide: Convert switch/case
 fallthrough; to break;
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Joe,

Please drop this chunk: it's a successive controller version number 
which are all backward compatible with "fallthrough" on each case so 
removing from this last one makes it inconsistent.

In sort: NACK for atmel-mci.

Best regards,
   Nicolas


On 09/09/2020 at 22:06, Joe Perches wrote:
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index 444bd3a0a922..8324312e4f42 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -2435,7 +2435,7 @@ static void atmci_get_cap(struct atmel_mci *host)
>          case 0x100:
>                  host->caps.has_bad_data_ordering = 0;
>                  host->caps.need_reset_after_xfer = 0;
> -               fallthrough;
> +               break;
>          case 0x0:
>                  break;
>          default:


-- 
Nicolas Ferre


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

