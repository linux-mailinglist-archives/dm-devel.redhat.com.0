Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B295624453B
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 09:07:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-Z1-ZdofCOjify9s-1MuS6w-1; Fri, 14 Aug 2020 03:07:21 -0400
X-MC-Unique: Z1-ZdofCOjify9s-1MuS6w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7806B85B685;
	Fri, 14 Aug 2020 07:07:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 567725C1A3;
	Fri, 14 Aug 2020 07:07:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 12283181A261;
	Fri, 14 Aug 2020 07:07:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07DFTD80027274 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 11:29:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3E66A2022797; Thu, 13 Aug 2020 15:29:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 017FD2022791
	for <dm-devel@redhat.com>; Thu, 13 Aug 2020 15:29:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2245C80121C
	for <dm-devel@redhat.com>; Thu, 13 Aug 2020 15:29:10 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam08on2071.outbound.protection.outlook.com [40.107.102.71])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-80-8Ci66iciMzSbvUO6WogcXw-1; Thu, 13 Aug 2020 11:29:03 -0400
X-MC-Unique: 8Ci66iciMzSbvUO6WogcXw-1
Received: from BN8PR06MB5714.namprd06.prod.outlook.com (2603:10b6:408:d2::32)
	by BN7PR06MB3875.namprd06.prod.outlook.com (2603:10b6:406:83::24)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16;
	Thu, 13 Aug 2020 15:29:01 +0000
Received: from BN8PR06MB5714.namprd06.prod.outlook.com
	([fe80::9438:86ca:efca:18b9]) by
	BN8PR06MB5714.namprd06.prod.outlook.com
	([fe80::9438:86ca:efca:18b9%3]) with mapi id 15.20.3283.018;
	Thu, 13 Aug 2020 15:29:01 +0000
From: "Meneghini, John" <John.Meneghini@netapp.com>
To: Mike Snitzer <snitzer@redhat.com>, Sagi Grimberg <sagi@grimberg.me>
Thread-Topic: [RESEND PATCH] nvme: explicitly use normal NVMe error handling
	when appropriate
Thread-Index: AQHWcYDS3N6K/RiKVU6UaUdcYydCWqk15t8A
Date: Thu, 13 Aug 2020 15:29:00 +0000
Message-ID: <A90B4EF6-354C-4735-9E5A-45BF27F520E2@netapp.com>
References: <E3390A8E-D582-47BA-A085-21663D883365@netapp.com>
	<20200806184057.GA27858@redhat.com> <20200806191943.GA27868@redhat.com>
	<6B826235-C504-4621-B8F7-34475B200979@netapp.com>
	<20200807000755.GA28957@redhat.com>
	<510f5aff-0437-b1ce-f7ab-c812edbea880@grimberg.me>
	<20200807045015.GA29737@redhat.com>
	<fec745aa-0091-ee1f-cb0f-da9e18cf0aa2@grimberg.me>
	<20200810143620.GA19127@redhat.com> <20200810172209.GA19535@redhat.com>
	<20200813144811.GA5452@redhat.com>
In-Reply-To: <20200813144811.GA5452@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.39.20071300
x-originating-ip: [216.240.30.25]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3cf6375-91db-494c-ac58-08d83f9d9ac0
x-ms-traffictypediagnostic: BN7PR06MB3875:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR06MB3875C1E99EFEAB4BC4C48C40E4430@BN7PR06MB3875.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BN8PR06MB5714.namprd06.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(66476007)(91956017)(76116006)(66946007)(33656002)(54906003)(8676002)(71200400001)(107886003)(66446008)(6512007)(64756008)(66556008)(8936002)(316002)(110136005)(4326008)(5660300002)(6486002)(36756003)(6506007)(966005)(186003)(478600001)(2906002)(26005)(83380400001)(2616005)(86362001);
	DIR:OUT; SFP:1101;
Content-ID: <3882C5DF93795248980DB4250D0A399D@namprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: netapp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR06MB5714.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cf6375-91db-494c-ac58-08d83f9d9ac0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2020 15:29:00.9540 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b0911a0-929b-4715-944b-c03745165b3a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tyRzcgtfYueFxu5PJjcwyPp4L6UnGOqoeuTb0nUnMFq3gKjfb4Bxh4N39s8m60atQlCH90MKai4S1lEK048xSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR06MB3875
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07DFTD80027274
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 14 Aug 2020 03:04:01 -0400
Cc: "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Chao Leng <lengchao@huawei.com>, Keith Busch <kbusch@kernel.org>,
	"Meneghini, 
	John" <John.Meneghini@netapp.com>, Ewan Milne <emilne@redhat.com>
Subject: Re: [dm-devel] [RESEND PATCH] nvme: explicitly use normal NVMe
 error handling when appropriate
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

TWlrZSwgCgpJIGRvbid0IHNlZSB5b3VyIHBhdGNoIGF0OgoKaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wcm9qZWN0L2xpbnV4LWJsb2NrL2xpc3QvP3N1Ym1pdHRlcj0xNjQzCgpDYW4geW91
IHBsZWFzZSB1cGxvYWQgdGhpcyBwYXRjaCB0aGVyZT8KClRoYW5rcywKCi9Kb2huCgrvu79PbiA4
LzEzLzIwLCAxMDo0OCBBTSwgIk1pa2UgU25pdHplciIgPHNuaXR6ZXJAcmVkaGF0LmNvbT4gd3Jv
dGU6CgogICAgQ29tbWl0IDc2NGU5MzMyMDk4YzAgKCJudm1lLW11bHRpcGF0aDogZG8gbm90IHJl
c2V0IG9uIHVua25vd24KICAgIHN0YXR1cyIpLCBhbW9uZyBvdGhlciB0aGluZ3MsIGZpeGVkIE5W
TUVfU0NfQ01EX0lOVEVSUlVQVEVEIGVycm9yCiAgICBoYW5kbGluZyBieSBjaGFuZ2luZyBtdWx0
aXBhdGhpbmcncyBudm1lX2ZhaWxvdmVyX3JlcSgpIHRvIHNob3J0LWNpcmN1aXQKICAgIHBhdGgg
ZmFpbG92ZXIgYW5kIHRoZW4gZmFsbGJhY2sgdG8gTlZNZSdzIG5vcm1hbCBlcnJvciBoYW5kbGlu
ZyAod2hpY2gKICAgIHRha2VzIGNhcmUgb2YgTlZNRV9TQ19DTURfSU5URVJSVVBURUQpLgoKICAg
IFRoaXMgZGV0b3VyIHRocm91Z2ggbmF0aXZlIE5WTWUgbXVsdGlwYXRoaW5nIGNvZGUgaXMgdW53
ZWxjb21lIGJlY2F1c2UKICAgIGl0IHByZXZlbnRzIE5WTWUgY29yZSBmcm9tIGhhbmRsaW5nIE5W
TUVfU0NfQ01EX0lOVEVSUlVQVEVEIGluZGVwZW5kZW50CiAgICBvZiBhbnkgbXVsdGlwYXRoaW5n
IGNvbmNlcm5zLgoKICAgIEludHJvZHVjZSBudm1lX3N0YXR1c19uZWVkc19sb2NhbF9lcnJvcl9o
YW5kbGluZygpIHRvIHByaW9yaXRpemUKICAgIG5vbi1mYWlsb3ZlciByZXRyeSwgd2hlbiBhcHBy
b3ByaWF0ZSwgaW4gdGVybXMgb2Ygbm9ybWFsIE5WTWUgZXJyb3IKICAgIGhhbmRsaW5nLiAgbnZt
ZV9zdGF0dXNfbmVlZHNfbG9jYWxfZXJyb3JfaGFuZGxpbmcoKSB3aWxsIG5hdHVyZWx5IGV2b2x2
ZQogICAgdG8gaW5jbHVkZSBoYW5kbGluZyBvZiBhbnkgb3RoZXIgZXJyb3JzIHRoYXQgbm9ybWFs
IGVycm9yIGhhbmRsaW5nIG11c3QKICAgIGJlIHVzZWQgZm9yLgoKICAgIG52bWVfZmFpbG92ZXJf
cmVxKCkncyBhYmlsaXR5IHRvIGZhbGxiYWNrIHRvIG5vcm1hbCBOVk1lIGVycm9yIGhhbmRsaW5n
CiAgICBoYXMgYmVlbiBwcmVzZXJ2ZWQgYmVjYXVzZSBpdCBtYXkgYmUgdXNlZnVsIGZvciBmdXR1
cmUgTlZNRV9TQyB0aGF0CiAgICBudm1lX3N0YXR1c19uZWVkc19sb2NhbF9lcnJvcl9oYW5kbGlu
ZygpIGhhc24ndCBiZWVuIHRyYWluZWQgZm9yIHlldC4KCiAgICBTaWduZWQtb2ZmLWJ5OiBNaWtl
IFNuaXR6ZXIgPHNuaXR6ZXJAcmVkaGF0LmNvbT4KICAgIC0tLQogICAgIGRyaXZlcnMvbnZtZS9o
b3N0L2NvcmUuYyB8IDE2ICsrKysrKysrKysrKysrLS0KICAgICAxIGZpbGUgY2hhbmdlZCwgMTQg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCiAgICBkaWZmIC0tZ2l0IGEvZHJpdmVycy9u
dm1lL2hvc3QvY29yZS5jIGIvZHJpdmVycy9udm1lL2hvc3QvY29yZS5jCiAgICBpbmRleCA4OGNm
ZjMwOWQ4ZTQuLmJlNzQ5YjY5MGFmNyAxMDA2NDQKICAgIC0tLSBhL2RyaXZlcnMvbnZtZS9ob3N0
L2NvcmUuYwogICAgKysrIGIvZHJpdmVycy9udm1lL2hvc3QvY29yZS5jCiAgICBAQCAtMjUyLDYg
KzI1MiwxNiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgbnZtZV9yZXFfbmVlZHNfcmV0cnkoc3RydWN0
IHJlcXVlc3QgKnJlcSkKICAgICAgICAgICAgcmV0dXJuIHRydWU7CiAgICAgfQoKICAgICtzdGF0
aWMgaW5saW5lIGJvb2wgbnZtZV9zdGF0dXNfbmVlZHNfbG9jYWxfZXJyb3JfaGFuZGxpbmcodTE2
IHN0YXR1cykKICAgICt7CiAgICArICAgICAgIHN3aXRjaCAoc3RhdHVzICYgMHg3ZmYpIHsKICAg
ICsgICAgICAgY2FzZSBOVk1FX1NDX0NNRF9JTlRFUlJVUFRFRDoKICAgICsgICAgICAgICAgICAg
ICByZXR1cm4gdHJ1ZTsKICAgICsgICAgICAgZGVmYXVsdDoKICAgICsgICAgICAgICAgICAgICBy
ZXR1cm4gZmFsc2U7CiAgICArICAgICAgIH0KICAgICt9CiAgICArCiAgICAgc3RhdGljIHZvaWQg
bnZtZV9yZXRyeV9yZXEoc3RydWN0IHJlcXVlc3QgKnJlcSkKICAgICB7CiAgICAgICAgICAgIHN0
cnVjdCBudm1lX25zICpucyA9IHJlcS0+cS0+cXVldWVkYXRhOwogICAgQEAgLTI3MCw3ICsyODAs
OCBAQCBzdGF0aWMgdm9pZCBudm1lX3JldHJ5X3JlcShzdHJ1Y3QgcmVxdWVzdCAqcmVxKQoKICAg
ICB2b2lkIG52bWVfY29tcGxldGVfcnEoc3RydWN0IHJlcXVlc3QgKnJlcSkKICAgICB7CiAgICAt
ICAgICAgIGJsa19zdGF0dXNfdCBzdGF0dXMgPSBudm1lX2Vycm9yX3N0YXR1cyhudm1lX3JlcShy
ZXEpLT5zdGF0dXMpOwogICAgKyAgICAgICB1MTYgbnZtZV9zdGF0dXMgPSBudm1lX3JlcShyZXEp
LT5zdGF0dXM7CiAgICArICAgICAgIGJsa19zdGF0dXNfdCBzdGF0dXMgPSBudm1lX2Vycm9yX3N0
YXR1cyhudm1lX3N0YXR1cyk7CgogICAgICAgICAgICB0cmFjZV9udm1lX2NvbXBsZXRlX3JxKHJl
cSk7CgogICAgQEAgLTI4MCw3ICsyOTEsOCBAQCB2b2lkIG52bWVfY29tcGxldGVfcnEoc3RydWN0
IHJlcXVlc3QgKnJlcSkKICAgICAgICAgICAgICAgICAgICBudm1lX3JlcShyZXEpLT5jdHJsLT5j
b21wX3NlZW4gPSB0cnVlOwoKICAgICAgICAgICAgaWYgKHVubGlrZWx5KHN0YXR1cyAhPSBCTEtf
U1RTX09LICYmIG52bWVfcmVxX25lZWRzX3JldHJ5KHJlcSkpKSB7CiAgICAtICAgICAgICAgICAg
ICAgaWYgKChyZXEtPmNtZF9mbGFncyAmIFJFUV9OVk1FX01QQVRIKSAmJiBudm1lX2ZhaWxvdmVy
X3JlcShyZXEpKQogICAgKyAgICAgICAgICAgICAgIGlmICghbnZtZV9zdGF0dXNfbmVlZHNfbG9j
YWxfZXJyb3JfaGFuZGxpbmcobnZtZV9zdGF0dXMpICYmCiAgICArICAgICAgICAgICAgICAgICAg
IChyZXEtPmNtZF9mbGFncyAmIFJFUV9OVk1FX01QQVRIKSAmJiBudm1lX2ZhaWxvdmVyX3JlcShy
ZXEpKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwoKICAgICAgICAgICAgICAg
ICAgICBpZiAoIWJsa19xdWV1ZV9keWluZyhyZXEtPnEpKSB7CiAgICAtLQogICAgMi4xOC4wCgoK
Ci0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3
LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

