Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8272F17C2F0
	for <lists+dm-devel@lfdr.de>; Fri,  6 Mar 2020 17:29:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583512157;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=DZGoUPSS6Nlt6nmVJreCWiHWfKUjF2woNiM7dNAcW1Q=;
	b=NXktgmsf+a/ythK1H9WRMGau2KmZMr4UorjJY36IK27wgR5EJxeXKZSEtjh+HADzvoRUbb
	J189eHZ2BLd9mEjI99WpRIqkiO1iThg7Wh1B+Lq7o5ZG3DKEEx7sb8ReQ0FXq/jcr17Nhf
	cUDYAv7Nu7XrWPMlq+tcvvs7DUUzDnE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-gDCqoDaPNe-SapWYl4SbIA-1; Fri, 06 Mar 2020 11:29:13 -0500
X-MC-Unique: gDCqoDaPNe-SapWYl4SbIA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CB15800D53;
	Fri,  6 Mar 2020 16:29:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0F3C8F341;
	Fri,  6 Mar 2020 16:29:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED11B18089CE;
	Fri,  6 Mar 2020 16:28:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 026GSjFb026899 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 6 Mar 2020 11:28:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B02F2163D03; Fri,  6 Mar 2020 16:28:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB247115160
	for <dm-devel@redhat.com>; Fri,  6 Mar 2020 16:28:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13EC1185A78F
	for <dm-devel@redhat.com>; Fri,  6 Mar 2020 16:28:43 +0000 (UTC)
Received: from m4a0072g.houston.softwaregrp.com
	(m4a0072g.houston.softwaregrp.com [15.124.2.130]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-170-zpCofeNoNpCJxSpJBC0p7A-1;
	Fri, 06 Mar 2020 11:28:40 -0500
X-MC-Unique: zpCofeNoNpCJxSpJBC0p7A-1
Received: FROM m4a0072g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0072g.houston.softwaregrp.com WITH ESMTP; 
	Fri,  6 Mar 2020 16:27:33 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Fri, 6 Mar 2020 16:26:08 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (15.124.8.14) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Fri, 6 Mar 2020 16:26:07 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (2603:10b6:3:14a::16)
	by DM5PR18MB1020.namprd18.prod.outlook.com (2603:10b6:3:2e::9) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2772.18; Fri, 6 Mar 2020 16:26:06 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1ec:4fbe:928d:8675]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1ec:4fbe:928d:8675%9]) with mapi id 15.20.2793.013;
	Fri, 6 Mar 2020 16:26:06 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [dm-devel] multipath-tools merges
Thread-Index: AQHV8HwZDbgM9Npzj0SiGjaZepz35ag12F2AgAAdLoCABdFdgA==
Date: Fri, 6 Mar 2020 16:26:06 +0000
Message-ID: <5773a737cfb455e37b3b54a728080d2087332734.camel@suse.com>
References: <CABr-Gne_oOns4W0A4Ny4t4xRPbU3qdtS5Z6BSt7wQ0N7cRqDeQ@mail.gmail.com>
	<3f8ae4512f68c5ba0cce93e5da27bb812dd8107e.camel@suse.com>
	<CABr-GnckSFPe5aRMQgRqUR2Lg9q5nomX00pL9JKOk-qoGAweMw@mail.gmail.com>
In-Reply-To: <CABr-GnckSFPe5aRMQgRqUR2Lg9q5nomX00pL9JKOk-qoGAweMw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4
x-originating-ip: [92.211.129.134]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c1f6259-5923-4b68-f043-08d7c1eb1297
x-ms-traffictypediagnostic: DM5PR18MB1020:
x-microsoft-antispam-prvs: <DM5PR18MB1020EA60D2754B648B111256FCE30@DM5PR18MB1020.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:626;
x-forefront-prvs: 0334223192
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(189003)(199004)(64756008)(66476007)(66556008)(91956017)(76116006)(2906002)(6512007)(86362001)(66946007)(66616009)(478600001)(966005)(6506007)(6486002)(81166006)(26005)(54906003)(4326008)(5660300002)(2616005)(36756003)(66446008)(81156014)(4744005)(8676002)(316002)(71200400001)(6916009)(186003)(8936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1020;
	H:DM5PR18MB1355.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Onnj2r45iI3m4fNVyrRw8BPpQkXRsD6aY8QGICZWOQrQHq1iwx/12+wa6hzGFCMx67aDdS1Zw1omvoxUwbFUMziZ6jfJOrEl1QCE9qyNKyQa9uZI52ZMHjUlaJA/ptgArpCN41Uy32bcPM8FEW6ivuPjBpRGzADpAkPPUMtpwZEH6z2AuegQBn2qQjY8fGZQnesqem1m1E1WsIqqs4B6outmWF4fDa34OLpMiDB3prFPuGmx6JAl+EJ29VDY+qWaclnn4MeIzMjP/u9ik8FdmTpYKvxq3ayr14xX/U6yePF9YaODAkGGKg+5A0ye+tVQucUbodFypqk368w+6vT+Rxc1MEneBi9AyLpCgp4IEDo4BE2asSmuwlZ3UptW8MXqNaXtQF7UH7Fjx1c8Uu94X4qtifjQ7ErH9DipAEpG0g2eNdpJHNTOgIzZQCAjg4ir4P6xoOIMrZ3mqYa8Xkb9r8SUJTRBF1sJhDrqc8oG/RPQHmiElAnUvbeITzsVbtUYmEnqWaz1BDQPLBiO0dnMww==
x-ms-exchange-antispam-messagedata: ka8WtQZ7Wzh/UOtcIHKNDNVz58YAJwWqSncCUDF4lEZ6+Oc1DMjwAh8A/E9iDeI+6y+8SDCPZ1egO5SghfdSrmHXW2B/sJWki+dcKk1NTfcXpBmU02P2gt9RKkBXCw9kdC/sflnNHdBIrJewwJnf1A==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c1f6259-5923-4b68-f043-08d7c1eb1297
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2020 16:26:06.8517 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kJkLaY6U5Iej+P825Gq6oKWvNfNFi1CbCdDLlWuFFR9eej3/RxFyWYg3HGP7lauPVwsc5rJ9YWfUQCNuWCZ8gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1020
X-OriginatorOrg: suse.com
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] multipath-tools merges
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
	boundary="_002_5773a737cfb455e37b3b54a728080d2087332734camelsusecom_"

--_002_5773a737cfb455e37b3b54a728080d2087332734camelsusecom_
Content-Type: text/plain; charset=ISO-8859-15
Content-ID: <B8A6D80ABBA60043BD7131D2D4E555E5@namprd18.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hello Christophe,

On Tue, 2020-03-03 at 00:35 +0100, Christophe Varoqui wrote:
> Hi Martin,
>=20
> Thanks for pointing these missing patches.
> They are now merged.

Thanks. Still a nit: you picked v1 of my=20
"libmultipath: drop mpp->nr_active field" patch (from Nov. 15th) rather
than v2 (from Nov. 20th):
https://www.redhat.com/archives/dm-devel/2019-November/msg00133.html

The v2 patch added some additional hunks (attached) and also a some
text in the commit message.

Regards,
Martin

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--_002_5773a737cfb455e37b3b54a728080d2087332734camelsusecom_
Content-Type: text/x-patch; name=drop-nr_active-v1-v2.diff; 
	charset=WINDOWS-1252
Content-Description: drop-nr_active-v1-v2.diff
Content-Disposition: attachment; filename="drop-nr_active-v1-v2.diff";
	size=1917; creation-date="Fri, 06 Mar 2020 16:26:06 GMT";
	modification-date="Fri, 06 Mar 2020 16:26:06 GMT"
Content-ID: <F13AB79C14C373419007F85BC91BE2B8@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2xpYm11bHRpcGF0aC9zdHJ1Y3RzX3ZlYy5jIGIvbGlibXVsdGlwYXRoL3N0
cnVjdHNfdmVjLmMKaW5kZXggMGM1YTNhODEuLjNkYmJhYTBmIDEwMDY0NAotLS0gYS9saWJtdWx0
aXBhdGgvc3RydWN0c192ZWMuYworKysgYi9saWJtdWx0aXBhdGgvc3RydWN0c192ZWMuYwpAQCAt
MzM0LDIyICszMzQsMjMgQEAgc3RhdGljIHZvaWQgbGVhdmVfcmVjb3ZlcnlfbW9kZShzdHJ1Y3Qg
bXVsdGlwYXRoICptcHApCiAJfQogfQogCi12b2lkIHNldF9ub19wYXRoX3JldHJ5KHN0cnVjdCBt
dWx0aXBhdGggKm1wcCkKK3ZvaWQgX19zZXRfbm9fcGF0aF9yZXRyeShzdHJ1Y3QgbXVsdGlwYXRo
ICptcHAsIGJvb2wgY2hlY2tfZmVhdHVyZXMpCiB7Ci0JYm9vbCBpc19xdWV1ZWluZyA9IDA7CisJ
Ym9vbCBpc19xdWV1ZWluZzsKIAotCWlmIChtcHAtPmZlYXR1cmVzICYmIHN0cnN0cihtcHAtPmZl
YXR1cmVzLCAicXVldWVfaWZfbm9fcGF0aCIpKQotCQlpc19xdWV1ZWluZyA9IDE7CisJY2hlY2tf
ZmVhdHVyZXMgPSBjaGVja19mZWF0dXJlcyAmJiBtcHAtPmZlYXR1cmVzICE9IE5VTEw7CisJaWYg
KGNoZWNrX2ZlYXR1cmVzKQorCQlpc19xdWV1ZWluZyA9IHN0cnN0cihtcHAtPmZlYXR1cmVzLCAi
cXVldWVfaWZfbm9fcGF0aCIpOwogCiAJc3dpdGNoIChtcHAtPm5vX3BhdGhfcmV0cnkpIHsKIAlj
YXNlIE5PX1BBVEhfUkVUUllfVU5ERUY6CiAJCWJyZWFrOwogCWNhc2UgTk9fUEFUSF9SRVRSWV9G
QUlMOgotCQlpZiAoaXNfcXVldWVpbmcpCisJCWlmICghY2hlY2tfZmVhdHVyZXMgfHwgaXNfcXVl
dWVpbmcpCiAJCQlkbV9xdWV1ZV9pZl9ub19wYXRoKG1wcC0+YWxpYXMsIDApOwogCQlicmVhazsK
IAljYXNlIE5PX1BBVEhfUkVUUllfUVVFVUU6Ci0JCWlmICghaXNfcXVldWVpbmcpCisJCWlmICgh
Y2hlY2tfZmVhdHVyZXMgfHwgIWlzX3F1ZXVlaW5nKQogCQkJZG1fcXVldWVfaWZfbm9fcGF0aCht
cHAtPmFsaWFzLCAxKTsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKQEAgLTM1OCw3ICszNTksOCBAQCB2
b2lkIHNldF9ub19wYXRoX3JldHJ5KHN0cnVjdCBtdWx0aXBhdGggKm1wcCkKIAkJCSAqIElmIGlu
X3JlY292ZXJ5IGlzIHNldCwgbGVhdmVfcmVjb3ZlcnlfbW9kZSgpIHRha2VzCiAJCQkgKiBjYXJl
IG9mIGRtX3F1ZXVlX2lmX25vX3BhdGguIE90aGVyd2lzZSwgZG8gaXQgaGVyZS4KIAkJCSAqLwot
CQkJaWYgKCFpc19xdWV1ZWluZyAmJiAhbXBwLT5pbl9yZWNvdmVyeSkKKwkJCWlmICgoIWNoZWNr
X2ZlYXR1cmVzIHx8ICFpc19xdWV1ZWluZykgJiYKKwkJCSAgICAhbXBwLT5pbl9yZWNvdmVyeSkK
IAkJCQlkbV9xdWV1ZV9pZl9ub19wYXRoKG1wcC0+YWxpYXMsIDEpOwogCQkJbGVhdmVfcmVjb3Zl
cnlfbW9kZShtcHApOwogCQl9IGVsc2UKZGlmZiAtLWdpdCBhL2xpYm11bHRpcGF0aC9zdHJ1Y3Rz
X3ZlYy5oIGIvbGlibXVsdGlwYXRoL3N0cnVjdHNfdmVjLmgKaW5kZXggNjc4ZWZlNGQuLjJhNWUz
ZDYwIDEwMDY0NAotLS0gYS9saWJtdWx0aXBhdGgvc3RydWN0c192ZWMuaAorKysgYi9saWJtdWx0
aXBhdGgvc3RydWN0c192ZWMuaApAQCAtMTEsNyArMTEsOCBAQCBzdHJ1Y3QgdmVjdG9ycyB7CiAJ
dmVjdG9yIG1wdmVjOwogfTsKIAotdm9pZCBzZXRfbm9fcGF0aF9yZXRyeShzdHJ1Y3QgbXVsdGlw
YXRoICptcHApOwordm9pZCBfX3NldF9ub19wYXRoX3JldHJ5KHN0cnVjdCBtdWx0aXBhdGggKm1w
cCwgYm9vbCBjaGVja19mZWF0dXJlcyk7CisjZGVmaW5lIHNldF9ub19wYXRoX3JldHJ5KG1wcCkg
X19zZXRfbm9fcGF0aF9yZXRyeShtcHAsIHRydWUpCiAKIGludCBhZG9wdF9wYXRocyAodmVjdG9y
IHBhdGh2ZWMsIHN0cnVjdCBtdWx0aXBhdGggKiBtcHApOwogdm9pZCBvcnBoYW5fcGF0aHModmVj
dG9yIHBhdGh2ZWMsIHN0cnVjdCBtdWx0aXBhdGggKm1wcCwK
--_002_5773a737cfb455e37b3b54a728080d2087332734camelsusecom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--_002_5773a737cfb455e37b3b54a728080d2087332734camelsusecom_--

