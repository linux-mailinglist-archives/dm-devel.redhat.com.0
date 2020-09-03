Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D5DFD25E2EE
	for <lists+dm-devel@lfdr.de>; Fri,  4 Sep 2020 22:41:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-UFGa8zQWMmi6dyAz6i5k7w-1; Fri, 04 Sep 2020 16:41:13 -0400
X-MC-Unique: UFGa8zQWMmi6dyAz6i5k7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C7D1420EA;
	Fri,  4 Sep 2020 20:41:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 368C460C05;
	Fri,  4 Sep 2020 20:40:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1469E18561B2;
	Fri,  4 Sep 2020 20:40:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 083Ff8pZ009273 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 11:41:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 846C0202348A; Thu,  3 Sep 2020 15:41:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D893202451D
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 15:41:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23909801226
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 15:41:06 +0000 (UTC)
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
	[67.219.246.114]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-18-gqYQl7dxP0SkaKzNJjg4Zw-1; Thu, 03 Sep 2020 11:40:59 -0400
X-MC-Unique: gqYQl7dxP0SkaKzNJjg4Zw-1
Received: from [100.112.6.216] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-c.us-east-1.aws.symcld.net id 95/EA-37059-F2B015F5;
	Thu, 03 Sep 2020 15:26:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WTfUwbZRzH+/Su7Y21eJS3xyb4R6PLVm1DSzW
	XzC0kzuQWJLKoWzKJcEBpG/tm76qgZgIzi1iXMXUxg1UYFLZss7xskDnGxoCV0YoNzMHGmFJo
	LYUNCThxLxTbHpv63+d73+/zfX6/5DkMES/xJZimjNFYTZRByk9AdbP+BLli466CzLpWgviu0
	icgehbqeMTlYAglQieaALH/8G0BYV9tExAH2u8DYqLGzc3GyB9r7wjIpothLmmvi6DkH5du8M
	nWczdQ8qz3kzz+Xp7eVGQuK+Tpeo6FuJamtLJRh5NfAabEX4IETIxXcOHa4l3AijCAs1M162I
	NwJPXvuGz4iGA/pODaEwAvBmB0+PLXFa4Udh/eVHAijYA7Q+XowUbMBTvRmDkAcaed3Bh0NvN
	Y8U0gEPukajAMD4ug8MdVOxACr4b3h0eizch+CyA90YnuDEjGbfA265OPhv6AM6NjPNYVkFH8
	z0ee9vzcGnsVjwvwgth8MqkIMZiPAv+NnA+zhtwNawM2pEYAzwNrnjOxPMIng4nAvVxhjgOnR
	d9CMupMDwT4bGrHQAwGBjhscZW2OH1rocy4Gi9HbCcCyM/fLvOMjjYO8Vn+X0486g6vjDEN8H
	jR/ayn5+Dpw760Rqgqv3PGCy/BBu6l/gsvwhbjs8jtfHVkuDQ0QDaANBT4JUiq16rY4yU3iBX
	ZmbKlUqVXC1XZREK6mN5scJGyzUUzciVCuojWkGXG4sNJQqThukA0cdWYkEXzoPh+UVFH3gW4
	0pTRZOCXQXixCJzSbmOonUFVptBQ/eBzRiG/3JloA5IUJPZpJFCUUtCNJdk1Wg1ZaV6Q/T5Po
	lCTChNEeXFbBFtoYy0XstaHpCF1YQdjQhWtehsRMTxJkm6qCAWxWNRnc30tOjJrzAKMiTJIsD
	hcMRCi8Zq1DP/9+dAOgakySIy1iLUm5in981FR+FGR/kpOzc2CkP9a0kquKeva1X7ttlac8cW
	Ngr8q4U9fQfP7hzKkZmvKqqFVVtLd7z9vcS3Td7I8RFHrqbfDHfmGXN+BklOpXQ+48IKtfaVI
	bTHg/+qlV8rPoxGCGCRnTnq6npZV/s4m6R6u1Ysqbn5yuuS2Wfy96sbdntvhQQ+m80ubn41pV
	6V82iyXfc5QSY6Ay51gLflrzeFXftOExV3vu4erMp7a7WcZNyPJb/3t8uG7h/a6fm70tUxfcl
	17mbnh06pglEz727yvLAyvudTEPzsvf4ZWfAQ8VqRcsRZaDv2hX6Jsve+8eCdZWrH6/4/05xh
	U1s1Z8Bt3q5GtuckOloGydILWyL5E1lSlNZRShlipal/AEJ6wMWFBAAA
X-Env-Sender: ahuang12@lenovo.com
X-Msg-Ref: server-30.tower-406.messagelabs.com!1599146798!484625!1
X-Originating-IP: [104.232.225.10]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15283 invoked from network); 3 Sep 2020 15:26:38 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.10)
	by server-30.tower-406.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
	encrypted SMTP; 3 Sep 2020 15:26:38 -0000
Received: from HKGWPEMAIL03.lenovo.com (unknown [10.128.3.71])
	(using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by Forcepoint Email with ESMTPS id F3C7328430E6927C708B;
	Thu,  3 Sep 2020 11:26:36 -0400 (EDT)
Received: from HKGWPEMAIL04.lenovo.com (10.128.3.72) by
	HKGWPEMAIL03.lenovo.com (10.128.3.71) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1913.5; Thu, 3 Sep 2020 23:28:17 +0800
Received: from HKEXEDGE01.lenovo.com (10.128.62.71) by HKGWPEMAIL04.lenovo.com
	(10.128.3.72) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5 via
	Frontend Transport; Thu, 3 Sep 2020 23:28:17 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (104.47.125.55)
	by mail.lenovo.com (10.128.62.71) with Microsoft SMTP Server
	(version=TLS1_2, 
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5;
	Thu, 3 Sep 2020 23:28:14 +0800
Received: from HK2PR0302MB2594.apcprd03.prod.outlook.com (2603:1096:202:c::8)
	by HK2PR03MB4337.apcprd03.prod.outlook.com (2603:1096:202:23::13)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.5;
	Thu, 3 Sep 2020 15:26:29 +0000
Received: from HK2PR0302MB2594.apcprd03.prod.outlook.com
	([fe80::dc8d:b50c:1dfa:b164]) by
	HK2PR0302MB2594.apcprd03.prod.outlook.com
	([fe80::dc8d:b50c:1dfa:b164%7]) with mapi id 15.20.3370.009;
	Thu, 3 Sep 2020 15:26:28 +0000
From: Adrian Huang12 <ahuang12@lenovo.com>
To: Coly Li <colyli@suse.de>, "linux-nvdimm@lists.01.org"
	<linux-nvdimm@lists.01.org>
Thread-Topic: [External] [PATCH] dax: fix for do not print error message for
	non-persistent memory block device
Thread-Index: AQHWgelAghvCHxCDAEee5fG8xErBNKlW+1Lg
Date: Thu, 3 Sep 2020 15:26:28 +0000
Message-ID: <HK2PR0302MB25945FB53762074E66FAC9FCB32C0@HK2PR0302MB2594.apcprd03.prod.outlook.com>
References: <20200903115549.17845-1-colyli@suse.de>
In-Reply-To: <20200903115549.17845-1-colyli@suse.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:b011:e002:37e1:4c72:58e5:53e9:1b12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cca28907-cf54-4673-64ad-08d8501dbab9
x-ms-traffictypediagnostic: HK2PR03MB4337:
x-microsoft-antispam-prvs: <HK2PR03MB4337EB0D83CF606FB7A016BEB32C0@HK2PR03MB4337.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0gcjYDc3rJnTN+xyNegLBmc5FRpak4JvvfesGcV8O0pstwj57f/98cZh1NK6CdbMJBl09hZTgq4S4c2lfXLA5qivHhj+dyf/MfK4sdaTRcGXzIl/93stVglbbytfZQ2kWtzcaJem/V76utnxxPHJ6gTMYYfdx+gWa+RCTLozQ/lh8uTWKVcl1L/GgGO4+mxX6nQnvx4mnm5YoOknmkZ+2LfIX0ozpZYaZTH/yPH73YioWg3ijPEae7lSaC+18VKeMzBjJjqGo/Dimxl8dlZj3m0K/g2Cny8JF36Yxhc9fi+7pSQm9ig4lbrvg1XmXsENQslK1JQkY8yLrWA44jC9IQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:HK2PR0302MB2594.apcprd03.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(64756008)(76116006)(66476007)(8676002)(6506007)(66446008)(9686003)(316002)(186003)(15650500001)(478600001)(2906002)(7696005)(55016002)(54906003)(8936002)(66556008)(66946007)(110136005)(86362001)(53546011)(33656002)(83380400001)(71200400001)(52536014)(5660300002)(4326008);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: z8Q8DnKsUkE4HymlfsMnbgGw6OX3vIfUVrAV/qIL2ppfOkEk5FHQKXxa8lsb3ifGqlh3HJZ2A2nAFe3iPg8V6v0A6uUrYxAIAg7ctiCLja9o8Fr9YftRtttd91PkxSgEynCZlAL7to0mDjXxZ7rojvjZuPjw7MBoZuQPR3s013EiULeR18QGBr8/gbSkOhMvjndo+ip9X13lO2qFvqUg66LolQ1T89+96rYbDTnqrY8nG5IesEgxTLunicrjDK7STITEteCLGniixh+TAuJXfTOTMGQ3AU8oDAKCwXZk75t2r8KHDGWfTk3Mic2BpoJx5EW7az/plS9W7v9GptcjA3vV7kSBciEATzkCpFJlUuFcwYI04SmbcfZBabLsJ1aMRhP46B0j8PLiPtfBhWScubjEidFw/srR7RToTPzEOemBGNfjXwXvXmNje/FSLDAtsa64kg/rngsv/PWyOfAxm6a15YYvPlfms5RgooF0ye6h8WJeuv1ySTeZUN6RMi2K/X+0qF2g1QidjkxiWoJzSC0pnQnNb+X5ICYXYUzkcnX1cpnNqELdyoOe1lVVVFXT+LzrRRCSF65eBqpUGzyI/atw9AA0MjSTqFIpHsNiRirTrxKq8qfJcGxapqwVx8/u8N/0msn22E8XfBKq9rjdyif7qizoKOq0mH5UUHXohhn84XjpAAg0vvyFrHiDOYiy6dFMcWBx10vLQ/kBuLtRcw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR0302MB2594.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cca28907-cf54-4673-64ad-08d8501dbab9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2020 15:26:28.9201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i6yx7vDhbd///V6G+biIUp9Vori/mJOXHkLWnyrala+wClHflcPbPbMX9P7Hatsm2ij90r7BSRQrCoo9aLcUrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR03MB4337
X-OriginatorOrg: lenovo.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 083Ff8pZ009273
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 04 Sep 2020 16:37:05 -0400
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
	Mike Snitzer <snitzer@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Jan Kara <jack@suse.com>, Ira Weiny <ira.weiny@intel.com>
Subject: Re: [dm-devel] [External] [PATCH] dax: fix for do not print error
 message for non-persistent memory block device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.004
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

> -----Original Message-----
> From: Coly Li <colyli@suse.de>
> Sent: Thursday, September 3, 2020 7:56 PM
> To: linux-nvdimm@lists.01.org
> Cc: dm-devel@redhat.com; Coly Li <colyli@suse.de>; Adrian Huang12
> <ahuang12@lenovo.com>; Ira Weiny <ira.weiny@intel.com>; Jan Kara
> <jack@suse.com>; Mike Snitzer <snitzer@redhat.com>; Pankaj Gupta
> <pankaj.gupta.linux@gmail.com>; Vishal Verma <vishal.l.verma@intel.com>
> Subject: [External] [PATCH] dax: fix for do not print error message for non-
> persistent memory block device
> 
> When calling __generic_fsdax_supported(), a dax-unsupported device may not
> have dax_dev as NULL, e.g. the dax related code block is not enabled by Kconfig.
> 
> Therefore in __generic_fsdax_supported(), to check whether a device supports
> DAX or not, the following order should be performed,
> - If dax_dev pointer is NULL, it means the device driver explicitly
>   announce it doesn't support DAX. Then it is OK to directly return
>   false from __generic_fsdax_supported().
> - If dax_dev pointer is NOT NULL, it might be because the driver doesn't
>   support DAX and not explicitly initialize related data structure. Then
>   bdev_dax_supported() should be called for further check.
> 
> IMHO if device driver desn't explicitly set its dax_dev pointer to NULL, this is not
> a bug. Calling bdev_dax_supported() makes sure they can be recognized as dax-
> unsupported eventually.
> 
> This patch does the following change for the above purpose,
>     -       if (!dax_dev && !bdev_dax_supported(bdev, blocksize)) {
>     +       if (!dax_dev || !bdev_dax_supported(bdev, blocksize)) {
> 
> 
> Fixes: c2affe920b0e ("dax: do not print error message for non-persistent
> memory block device")
> Signed-off-by: Coly Li <colyli@suse.de>

The dax error messages ("dm-X: error: dax access failed (-95)") are gone away when executing the command 'lvm2-testsuite --only activate-minor'.

Reviewed-and-Tested-by: Adrian Huang <ahuang12@lenovo.com>

> Cc: Adrian Huang <ahuang12@lenovo.com>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: Jan Kara <jack@suse.com>
> Cc: Mike Snitzer <snitzer@redhat.com>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Vishal Verma <vishal.l.verma@intel.com>
> ---
>  drivers/dax/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dax/super.c b/drivers/dax/super.c index
> 32642634c1bb..e5767c83ea23 100644
> --- a/drivers/dax/super.c
> +++ b/drivers/dax/super.c
> @@ -100,7 +100,7 @@ bool __generic_fsdax_supported(struct dax_device
> *dax_dev,
>  		return false;
>  	}
> 
> -	if (!dax_dev && !bdev_dax_supported(bdev, blocksize)) {
> +	if (!dax_dev || !bdev_dax_supported(bdev, blocksize)) {
>  		pr_debug("%s: error: dax unsupported by block device\n",
>  				bdevname(bdev, buf));
>  		return false;
> --
> 2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

