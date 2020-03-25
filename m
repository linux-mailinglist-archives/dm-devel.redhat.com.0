Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3B6192C71
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 16:27:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585150057;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CmyOtlmEuUBQpikpkPd1jCs4C/sWnmSDFHVe83wlvhg=;
	b=WUJWEFPwzSjjXcxE5GU9be+YpJ0ge74gqNAoCZziNiS0T9k5SzCqLV9SQXL3HNFi/t1K/h
	2UROpeV5qPkfvpYsK6B02B0XZW8xorWDZmmI0/mFMbmPrZ5EybwHECWABCQBcVcs9DjAfK
	0AFur8dSCz6jLmWT1RLizI6XYSOmjJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-LnvwuK31Ndax7wgin0n37A-1; Wed, 25 Mar 2020 11:27:34 -0400
X-MC-Unique: LnvwuK31Ndax7wgin0n37A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB08B8010EE;
	Wed, 25 Mar 2020 15:27:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D074CFCE;
	Wed, 25 Mar 2020 15:27:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90E2C182B00F;
	Wed, 25 Mar 2020 15:27:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02PFPwUL012147 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 11:25:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D765E10A4781; Wed, 25 Mar 2020 15:25:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D25C310A4782
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 15:25:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30742101A55D
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 15:25:56 +0000 (UTC)
Received: from m4a0072g.houston.softwaregrp.com
	(m4a0072g.houston.softwaregrp.com [15.124.2.130]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-168-nvVVdp-EOyiYr_nboD48qw-1;
	Wed, 25 Mar 2020 11:25:53 -0400
X-MC-Unique: nvVVdp-EOyiYr_nboD48qw-1
Received: FROM m4a0072g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0072g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 25 Mar 2020 15:24:33 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 25 Mar 2020 15:22:10 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (15.124.8.14) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 25 Mar 2020 15:22:09 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (2603:10b6:3:14a::16)
	by DM5PR18MB1514.namprd18.prod.outlook.com (2603:10b6:3:145::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22;
	Wed, 25 Mar 2020 15:22:08 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1ec:4fbe:928d:8675]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1ec:4fbe:928d:8675%9]) with mapi id 15.20.2856.019;
	Wed, 25 Mar 2020 15:22:08 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 1/3] libmultipath: assign variable to make gcc happy
Thread-Index: AQHWArkma4JfKacI7U+5zAdDVfAmDg==
Date: Wed, 25 Mar 2020 15:22:08 +0000
Message-ID: <1c843854bf71e0ddbf8f4b81e33276c05504e0cc.camel@suse.com>
References: <1585083834-14237-1-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1585083834-14237-1-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4
x-originating-ip: [92.211.129.134]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 174adec5-5f06-4f93-e534-08d7d0d048a6
x-ms-traffictypediagnostic: DM5PR18MB1514:
x-microsoft-antispam-prvs: <DM5PR18MB1514D8AAD06754FC95938FAEFCCE0@DM5PR18MB1514.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(66556008)(36756003)(81166006)(66946007)(86362001)(8676002)(6486002)(6506007)(91956017)(66476007)(64756008)(66574012)(81156014)(6512007)(76116006)(110136005)(66446008)(4326008)(26005)(186003)(316002)(4744005)(8936002)(2906002)(71200400001)(478600001)(2616005)(5660300002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1514;
	H:DM5PR18MB1355.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d2BW6uEeMeUThQ+Xc8iWDAJH1CyEu/ByrwafkHEkKjgSKyi5X8BF+vTg1w5EQqtrggGAswHhybKQe11e467Ru5PUy7eZwMqDKcq8cq+N9yCEjACdPUOZSBc1Gj1hUBSOF8MrFeCWuG/jE8rhr+i2D3h1dlqwuyhLwueGU2ifY5JXA4R2N4l4dgTC0Q8y9rGi2gCGZp3CNPf5LufTWkQV+jpPDf2HGdgzYl2aroAiwrHt2LApBCKr9iiqlL5Dn8HSuEfP1SiZixvN7i27HBtmlM0MkMd/4nsNJcMA6/1+UGa6m9OYBLiOBeGmxwFVtcE97SXKj1F5EGZDTzKDTw6uOQ+2ZPWbciXhOak1jUNsp6WWwEASUVKvH0hfv7CXcatrolj6Bv0L4vlMhbVNXARPCPYHEtGGQqJwds+9v50w3IJcRaagzDmW5mUHciJj4fKj
x-ms-exchange-antispam-messagedata: Pv5OZPbLO55a1J8ARpbuwG1yf2cXf7xI2fbsHIdiyPRqCyKKSseebHUN45YypRFaG/tLZwk4gvzG4yGvtmJMh+d/37Q1lnYtLgc4vrNmoe17OjRJE3PAjWBQ0nuzsC025b4Cr6Z9/ymIIvIxjfI1kw==
x-ms-exchange-transport-forked: True
Content-ID: <E91DB4E9132D324ABBFC1D6009367806@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 174adec5-5f06-4f93-e534-08d7d0d048a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 15:22:08.5717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9eOYofp4LupktUBCnPO/0s8Mo/K8b4ggQT6xZdM+Ky6hT2AYhh8vb/qCimBTNALfD5SnSVikrz/f4XR2NoHnZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1514
X-OriginatorOrg: suse.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02PFPwUL012147
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/3] libmultipath: assign variable to make
	gcc happy
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIwLTAzLTI0IGF0IDE2OjAzIC0wNTAwLCBCZW5qYW1pbiBNYXJ6aW5za2kgd3Jv
dGU6Cj4gVGhlcmUgaXMgbm90aGluZyB3cm9uZyB3aXRoIGlzX3F1ZXVlaW5nIG5vdCBiZWluZyBz
ZXQgYXQgdGhlIHN0YXJ0Cj4gb2YgX19zZXRfbm9fcGF0aF9yZXRyeSgpLCBpdCB3aWxsIGFsd2F5
cyBnZXQgc2V0IGJlZm9yZSBpdCBpcwo+IGFjY2Vzc2VkLAo+IGJ1dCBnY2MgOC4yLjEgaXMgZmFp
bGluZyB3aXRoCj4gCj4gc3RydWN0c192ZWMuYzogSW4gZnVuY3Rpb24g4oCYX19zZXRfbm9fcGF0
aF9yZXRyeeKAmToKPiBzdHJ1Y3RzX3ZlYy5jOjMzOTo3OiBlcnJvcjog4oCYaXNfcXVldWVpbmfi
gJkgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZAo+IGluCj4gdGhpcyBmdW5jdGlvbiBbLVdlcnJv
cj1tYXliZS11bmluaXRpYWxpemVkXQo+ICAgYm9vbCBpc19xdWV1ZWluZzsKPiAgICAgICAgXn5+
fn5+fn5+fn4KPiAKPiBzbywgYXNzaWduIGEgdmFsdWUgdG8gbWFrZSBpdCBoYXBweS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBNYXJ6aW5za2kgPGJtYXJ6aW5zQHJlZGhhdC5jb20+Cj4g
LS0tCj4gIGxpYm11bHRpcGF0aC9zdHJ1Y3RzX3ZlYy5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKClRoYXQgYWN0dWFsbHkgbG9va3MgbGlr
ZSBhIGdjYyBidWcgdG8gbWUuIEFueXdheToKClJldmlld2VkLWJ5OiBNYXJ0aW4gV2lsY2sgPG13
aWxja0BzdXNlLmRlPgoKLS0gCkRyLiBNYXJ0aW4gV2lsY2sgPG13aWxja0BzdXNlLmNvbT4sIFRl
bC4gKzQ5ICgwKTkxMSA3NDA1MyAyMTA3ClNVU0UgIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55
IEdtYkgKSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcgR0Y6IEZlbGl4CkltZW5kw7ZyZmZlcgoKCgot
LQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5y
ZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

