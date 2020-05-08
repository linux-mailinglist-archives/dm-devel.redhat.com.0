Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 04ACB1CA6E4
	for <lists+dm-devel@lfdr.de>; Fri,  8 May 2020 11:16:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588929404;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=PbVpQz1kzv3MwolrnJDAuEsX4yF2mGgn4/G7ZypXwxo=;
	b=ABSWuiFUmrvFOpg5kkC3e4B74I+9wA7t8U+fh/m1J35Wdi9Syz8QwFqO8P+1MpiR6uBQ+Y
	Qo1PAldFi6QtQ93Vm8Ht56gzNk4fjVws1yNE/wuZcy5b2dzdVasLWQm5Tuh6Y5XX0L2k5T
	jFb4Yg7Od2O1ri5E80mmVH1EkKtKXCM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-ijRh0favMHemfCwnK5h_AQ-1; Fri, 08 May 2020 05:16:42 -0400
X-MC-Unique: ijRh0favMHemfCwnK5h_AQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B94F68014D7;
	Fri,  8 May 2020 09:16:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13B412E052;
	Fri,  8 May 2020 09:16:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC1F21809543;
	Fri,  8 May 2020 09:16:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0489GMTN001850 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 05:16:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B420C2029F6F; Fri,  8 May 2020 09:16:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF84C2029F70
	for <dm-devel@redhat.com>; Fri,  8 May 2020 09:16:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 817798007DB
	for <dm-devel@redhat.com>; Fri,  8 May 2020 09:16:20 +0000 (UTC)
Received: from m4a0072g.houston.softwaregrp.com
	(m4a0072g.houston.softwaregrp.com [15.124.2.130]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-277-tTvL7NN_MzWxLhVU042mog-1;
	Fri, 08 May 2020 05:16:17 -0400
X-MC-Unique: tTvL7NN_MzWxLhVU042mog-1
Received: FROM m4a0072g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0072g.houston.softwaregrp.com WITH ESMTP; 
	Fri,  8 May 2020 09:15:08 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Fri, 8 May 2020 09:15:33 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (15.124.72.12) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Fri, 8 May 2020 09:15:33 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com (2603:10b6:4:62::23)
	by DM5PR1801MB1900.namprd18.prod.outlook.com (2603:10b6:4:63::18)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29;
	Fri, 8 May 2020 09:15:32 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710]) by
	DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710%7]) with mapi id 15.20.2958.035;
	Fri, 8 May 2020 09:15:32 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH] libmultipath: simplify failed wwid code
Thread-Index: AQHWIAlxV4/qswDl6UOGle6Vr20S9Kid8l6A
Date: Fri, 8 May 2020 09:15:32 +0000
Message-ID: <55e6cd5b0826a0393bbd2cd15e3cf9f31f8f0986.camel@suse.com>
References: <1588372766-21317-1-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1588372766-21317-1-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2
x-originating-ip: [92.211.129.134]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 544d9682-a290-4317-f383-08d7f3305c36
x-ms-traffictypediagnostic: DM5PR1801MB1900:
x-microsoft-antispam-prvs: <DM5PR1801MB1900C6775012AFE112DB34DCFCA20@DM5PR1801MB1900.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 039735BC4E
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RT0dyxxp9wLX1E/cGNJPgwVRXS0Apc4P/R2B2j5Pl+zvnapJv288EdnpUoAmsKB5XrBDrgOWKrkaE0GSZCxcuYsGU27e/IyoM4/vg9xzIFYUUjBslSpw3eU6mYUlSCw+wlFiR9L6kU/WUU0MK1/0X/XprN9/nh7SnY426VvXnPVWey2t7Of3UPmE5YXy0DRCx6S0dkKehWxzRrGyOsj5VVk2PG+GJZmDFn/nv9FcXUFJQqeeWpApGptiMn3DcoziywBalJCWJltVBXpT6ZmCQj9rOLKa9YoovB8iKl7bKNa+2B3evolDVuQrTE1bt7xnDOY5RBfLSvyhADNb3SJvJmpvrAkEkxC6zfdtk7mIykoebhHIRcbMQsB9e29AeZI7BeOfLy+IXMCscg0RmoV0oY8wxT6iHhIkgpElIPT+YBXLbLGWolKlM2goub9EXzQsD7g7vtBJdqoK0Jozx1cZCwmyVs/4UvOB8X+cYn0Yg9xXbT8pnjAStIUlSdVUdMB1OhImdKxy+3YseBjGC+4ZAA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM5PR1801MB1883.namprd18.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(33430700001)(478600001)(86362001)(33440700001)(8936002)(99936003)(186003)(83300400001)(110136005)(8676002)(36756003)(26005)(83310400001)(83320400001)(83290400001)(83280400001)(2906002)(5660300002)(64756008)(66616009)(6506007)(66446008)(2616005)(6486002)(66556008)(76116006)(316002)(71200400001)(66946007)(91956017)(4326008)(6512007)(66476007);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: j+4+Bpe3PAAs4Zobwb/yEHRfoE2Q2k6lq2IBURz1iocaSIYSqNVGNcZxHK+36Ssya3sakC9OIkIgl8bIB6XnY2vhdTT5rM785KATLVw6xizwEyLPOvhrWq39iST0j3iXjMsCtwFo5QGT1g93nMoH+5jGRdgT5zPoJar1QjMfM720nelBzauW1IHIiyBjbeHVIWn3xgWqxw0cNcoMQu8yj4W1EJTMJhzkyde+ropR3tuuvSsfb2mwG0NZNxGYhKm04/S1p1etz7vKRCO5cKsCSZ2F61qpp1ZpRTbePL0vkVf/k7vNcz9T1N/TU8nsxb22Q46zsQyu5IQmdfKxosmK/msxZwCZAWR/F73wRqDa/+GqytlHbY1KrBCHKtw+mnGLp3ONlF+r75BJvY/Asu9Czkjph1T6OWMQsRFjllGBX6Acn8g0S2HOxEgAtNL708efTmByPY30JGzEntJptMb174HFH+CBpk317m3pck7AsnNwnZ/dJexWi0IBri/+DitW
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 544d9682-a290-4317-f383-08d7f3305c36
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2020 09:15:32.6489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wkj1kOp8U03fjmBdeQL1GnmZTbfaiRQpGjWeMSNCmMKEr0CXunCBQ+g2dCku8UZy0LWyVzEEN92uxzZPhAidMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1801MB1900
X-OriginatorOrg: suse.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] libmultipath: simplify failed wwid code
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
	boundary="_002_55e6cd5b0826a0393bbd2cd15e3cf9f31f8f0986camelsusecom_"

--_002_55e6cd5b0826a0393bbd2cd15e3cf9f31f8f0986camelsusecom_
Content-Type: text/plain; charset=ISO-8859-15
Content-ID: <7D09121A6E76E548BA8A587202C4C8A2@namprd18.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-05-01 at 17:39 -0500, Benjamin Marzinski wrote:
> The (is|mark|unmark)_failed_wwid code is needlessly complicated.
> Locking a file is necssary if multiple processes could otherwise be
> writing to it at the same time. That is not the case with the
> failed_wwids files. They can simply be empty files in a
> directory.  Even
> with all the locking in place, two processes accessing or modifying a
> file at the same time will still race. And even without the locking,
> if
> two processes try to access or modify a file at the same time, they
> will
> both see a reasonable result, and will leave the files in a valid
> state
> afterwards.
>=20
> Instead of doing all the locking work (which made it necessary to
> write
> a file, even just to check if a file existed), simply check for files
> with lstat(), create them with open(), and remove them with unlink().
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/wwids.c | 131 ++++++++++++++++++-----------------------
> --
>  1 file changed, 56 insertions(+), 75 deletions(-)

I agree, almost :-)

Please consider adding the attached patch on top, which switches back
to atomic creation of the failed_wwids file, with just a little bit
more compexity. I prefer the creation of the file to be atomic on the
file system level. IMO that's how "flag" files like this should be
handled in principle, and doing it correctly makes me feel better, even
though I have to concur that an actual race is hardly possible.

Regards,
Martin


--_002_55e6cd5b0826a0393bbd2cd15e3cf9f31f8f0986camelsusecom_
Content-Type: text/x-patch;
	name="0001-libmultipath-use-atomic-linkat-in-mark_failed_wwid.patch"
Content-Description: 0001-libmultipath-use-atomic-linkat-in-mark_failed_wwid.patch
Content-Disposition: attachment;
	filename="0001-libmultipath-use-atomic-linkat-in-mark_failed_wwid.patch";
	size=2840; creation-date="Fri, 08 May 2020 09:15:32 GMT";
	modification-date="Fri, 08 May 2020 09:15:32 GMT"
Content-ID: <81B85FF2FFFB4B47A76B0C9E39F22AFF@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSBkMGU0NjY5YzkyODYzZjk4Y2RiZTdiNDFhOGE5YjY0MjIzOTU4YmVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJ0aW4gV2lsY2sgPG13aWxja0BzdXNlLmNvbT4KRGF0ZTog
RnJpLCA4IE1heSAyMDIwIDAwOjUxOjUwICswMjAwClN1YmplY3Q6IFtQQVRDSF0gbGlibXVsdGlw
YXRoOiB1c2UgYXRvbWljIGxpbmthdCgpIGluIG1hcmtfZmFpbGVkX3d3aWQoKQoKVGhpcyBrZWVw
cyAoYWxtb3N0KSB0aGUgc2ltcGxpY2l0eSBvZiB0aGUgcHJldmlvdXMgcGF0Y2gsIHdoaWxlCm1h
a2luZyBzdXJlIHRoYXQgdGhlIHJldHVybiB2YWx1ZSBvZiBtYXJrX2ZhaWxlZF93d2lkKCkKKFdX
SURfRkFJTEVEX0NIQU5HRUQgdnMuIFdXSURfRkFJTEVEX1VOQ0hBTkdFRCkgaXMgY29ycmVjdCwg
ZXZlbgppZiBzZXZlcmFsIHByb2Nlc3NlcyBhY2Nlc3MgdGhpcyBXV0lEIGF0IHRoZSBzYW1lIHRp
bWUuCgpTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gV2lsY2sgPG13aWxja0BzdXNlLmNvbT4KLS0tCiBs
aWJtdWx0aXBhdGgvd3dpZHMuYyB8IDQyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2xpYm11bHRpcGF0aC93d2lkcy5jIGIvbGlibXVsdGlwYXRoL3d3
aWRzLmMKaW5kZXggYjE1YjE0NmIuLmNjZGQxM2QyIDEwMDY0NAotLS0gYS9saWJtdWx0aXBhdGgv
d3dpZHMuYworKysgYi9saWJtdWx0aXBhdGgvd3dpZHMuYwpAQCAtMzc0LDcgKzM3NCw3IEBAIGlu
dCBpc19mYWlsZWRfd3dpZChjb25zdCBjaGFyICp3d2lkKQogCiAJaWYgKHNhZmVfc3ByaW50Zihw
YXRoLCAiJXMvJXMiLCBzaG1fZGlyLCB3d2lkKSkgewogCQljb25kbG9nKDEsICIlczogcGF0aCBu
YW1lIG92ZXJmbG93IiwgX19mdW5jX18pOwotCQlyZXR1cm4gLTE7CisJCXJldHVybiBXV0lEX0ZB
SUxFRF9FUlJPUjsKIAl9CiAKIAlpZiAobHN0YXQocGF0aCwgJnN0KSA9PSAwKQpAQCAtMzkwLDI3
ICszOTAsNDMgQEAgaW50IGlzX2ZhaWxlZF93d2lkKGNvbnN0IGNoYXIgKnd3aWQpCiAKIGludCBt
YXJrX2ZhaWxlZF93d2lkKGNvbnN0IGNoYXIgKnd3aWQpCiB7Ci0JY2hhciBwYXRoW1BBVEhfTUFY
XTsKLQlpbnQgciwgZmQ7CisJY2hhciB0bXBmaWxlW1dXSURfU0laRSArIDIgKiBzaXplb2YobG9u
ZykgKyAxXTsKKwlpbnQgciA9IFdXSURfRkFJTEVEX0VSUk9SLCBmZCwgZGZkOwogCi0JaWYgKHNh
ZmVfc3ByaW50ZihwYXRoLCAiJXMvJXMiLCBzaG1fZGlyLCB3d2lkKSkgewotCQljb25kbG9nKDEs
ICIlczogcGF0aCBuYW1lIG92ZXJmbG93IiwgX19mdW5jX18pOwotCQlyZXR1cm4gLTE7CisJZGZk
ID0gb3BlbihzaG1fZGlyLCBPX1JET05MWXxPX0RJUkVDVE9SWSk7CisJaWYgKGRmZCA9PSAtMSAm
JiBlcnJubyA9PSBFTk9FTlQpIHsKKwkJY2hhciBwYXRoW3NpemVvZihzaG1fZGlyKSArIDJdOwor
CisJCS8qIGFyZyBmb3IgZW5zdXJlX2RpcmVjdG9yaWVzX2V4aXN0KCkgbXVzdCBub3QgZW5kIHdp
dGggIi8iICovCisJCXNhZmVfc3ByaW50ZihwYXRoLCAiJXMvXyIsIHNobV9kaXIpOworCQllbnN1
cmVfZGlyZWN0b3JpZXNfZXhpc3QocGF0aCwgMDcwMCk7CisJCWRmZCA9IG9wZW4oc2htX2Rpciwg
T19SRE9OTFl8T19ESVJFQ1RPUlkpOwogCX0KLQlpZiAoZW5zdXJlX2RpcmVjdG9yaWVzX2V4aXN0
KHBhdGgsIDA3MDApIDwgMCkgewotCQljb25kbG9nKDEsICIlczogY2FuJ3Qgc2V0dXAgZGlyZWN0
b3JpZXMiLCBfX2Z1bmNfXyk7Ci0JCXJldHVybiAtMTsKKwlpZiAoZGZkID09IC0xKSB7CisJCWNv
bmRsb2coMSwgIiVzOiBjYW4ndCBzZXR1cCAlczogJW0iLCBfX2Z1bmNfXywgc2htX2Rpcik7CisJ
CXJldHVybiBXV0lEX0ZBSUxFRF9FUlJPUjsKIAl9CiAKLQlmZCA9IG9wZW4ocGF0aCwgT19SRE9O
TFkgfCBPX0NSRUFUIHwgT19FWENMLCBTX0lSVVNSKTsKLQlpZiAoZmQgPj0gMCkgeworCXNhZmVf
c3ByaW50Zih0bXBmaWxlLCAiJXMuJWx4Iiwgd3dpZCwgKGxvbmcpZ2V0cGlkKCkpOworCWZkID0g
b3BlbmF0KGRmZCwgdG1wZmlsZSwgT19SRE9OTFkgfCBPX0NSRUFUIHwgT19FWENMLCBTX0lSVVNS
KTsKKwlpZiAoZmQgPj0gMCkKIAkJY2xvc2UoZmQpOworCWVsc2UKKwkJZ290byBvdXRfY2xvc2Vk
aXI7CisKKwlpZiAobGlua2F0KGRmZCwgdG1wZmlsZSwgZGZkLCB3d2lkLCAwKSA9PSAwKQogCQly
ID0gV1dJRF9GQUlMRURfQ0hBTkdFRDsKLQl9IGVsc2UgaWYgKGVycm5vID09IEVFWElTVCkKKwll
bHNlIGlmIChlcnJubyA9PSBFRVhJU1QpCiAJCXIgPSBXV0lEX0ZBSUxFRF9VTkNIQU5HRUQ7CiAJ
ZWxzZQogCQlyID0gV1dJRF9GQUlMRURfRVJST1I7CiAKKwlpZiAodW5saW5rYXQoZGZkLCB0bXBm
aWxlLCAwKSA9PSAtMSkKKwkJY29uZGxvZygyLCAiJXM6IGZhaWxlZCB0byB1bmxpbmsgJXMvJXM6
ICVtIiwKKwkJCV9fZnVuY19fLCBzaG1fZGlyLCB0bXBmaWxlKTsKKworb3V0X2Nsb3NlZGlyOgor
CWNsb3NlKGRmZCk7CiAJcHJpbnRfZmFpbGVkX3d3aWRfcmVzdWx0KCJtYXJrX2ZhaWxlZCIsIHd3
aWQsIHIpOwogCXJldHVybiByOwogfQpAQCAtNDIyLDcgKzQzOCw3IEBAIGludCB1bm1hcmtfZmFp
bGVkX3d3aWQoY29uc3QgY2hhciAqd3dpZCkKIAogCWlmIChzYWZlX3NwcmludGYocGF0aCwgIiVz
LyVzIiwgc2htX2Rpciwgd3dpZCkpIHsKIAkJY29uZGxvZygxLCAiJXM6IHBhdGggbmFtZSBvdmVy
ZmxvdyIsIF9fZnVuY19fKTsKLQkJcmV0dXJuIC0xOworCQlyZXR1cm4gV1dJRF9GQUlMRURfRVJS
T1I7CiAJfQogCiAJaWYgKHVubGluayhwYXRoKSA9PSAwKQotLSAKMi4yNi4yCgo=
--_002_55e6cd5b0826a0393bbd2cd15e3cf9f31f8f0986camelsusecom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--_002_55e6cd5b0826a0393bbd2cd15e3cf9f31f8f0986camelsusecom_--

