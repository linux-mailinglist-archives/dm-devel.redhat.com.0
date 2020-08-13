Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 58CC624452A
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 09:04:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-ZzN71eajOKudyghmp2mdPQ-1; Fri, 14 Aug 2020 03:04:44 -0400
X-MC-Unique: ZzN71eajOKudyghmp2mdPQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF206801A9D;
	Fri, 14 Aug 2020 07:04:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8857760C87;
	Fri, 14 Aug 2020 07:04:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D34B180B657;
	Fri, 14 Aug 2020 07:04:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07DFxccO030439 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 11:59:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 91E1B2157F4A; Thu, 13 Aug 2020 15:59:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6118B2166BDD
	for <dm-devel@redhat.com>; Thu, 13 Aug 2020 15:59:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32D6785A5A7
	for <dm-devel@redhat.com>; Thu, 13 Aug 2020 15:59:32 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam07on2079.outbound.protection.outlook.com [40.107.95.79])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-197-R1JN8pc4OSq18JDFDxY5oQ-1; Thu, 13 Aug 2020 11:59:26 -0400
X-MC-Unique: R1JN8pc4OSq18JDFDxY5oQ-1
Received: from BN8PR06MB5714.namprd06.prod.outlook.com (2603:10b6:408:d2::32)
	by BN7PR06MB4004.namprd06.prod.outlook.com (2603:10b6:406:8f::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15;
	Thu, 13 Aug 2020 15:59:22 +0000
Received: from BN8PR06MB5714.namprd06.prod.outlook.com
	([fe80::9438:86ca:efca:18b9]) by
	BN8PR06MB5714.namprd06.prod.outlook.com
	([fe80::9438:86ca:efca:18b9%3]) with mapi id 15.20.3283.018;
	Thu, 13 Aug 2020 15:59:22 +0000
From: "Meneghini, John" <John.Meneghini@netapp.com>
To: Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [RESEND PATCH] nvme: explicitly use normal NVMe error handling
	when appropriate
Thread-Index: AQHWcYDS3N6K/RiKVU6UaUdcYydCWqk15t8AgABHDwD//8FsgA==
Date: Thu, 13 Aug 2020 15:59:22 +0000
Message-ID: <5A6AA63E-77FE-45CB-A16B-67AAB9346531@netapp.com>
References: <20200806191943.GA27868@redhat.com>
	<6B826235-C504-4621-B8F7-34475B200979@netapp.com>
	<20200807000755.GA28957@redhat.com>
	<510f5aff-0437-b1ce-f7ab-c812edbea880@grimberg.me>
	<20200807045015.GA29737@redhat.com>
	<fec745aa-0091-ee1f-cb0f-da9e18cf0aa2@grimberg.me>
	<20200810143620.GA19127@redhat.com> <20200810172209.GA19535@redhat.com>
	<20200813144811.GA5452@redhat.com>
	<A90B4EF6-354C-4735-9E5A-45BF27F520E2@netapp.com>
	<20200813154320.GA5707@redhat.com>
In-Reply-To: <20200813154320.GA5707@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.39.20071300
x-originating-ip: [216.240.30.25]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f3e2439-295a-4a31-98d2-08d83fa1d883
x-ms-traffictypediagnostic: BN7PR06MB4004:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR06MB4004FFBCB5F33085BC932649E4430@BN7PR06MB4004.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VV8H6jqtbrjCJHODcCbzi6uytm1rIjSOTq1iOVwp4+xsN4qgIc6xoZ8XSLoJA1Obw+fSKCJX8wA/CdgroN7eRgj7W1C4dXQzLF06YMnbWxicpCpc8tC7vQJP7TeUyD2It8YhIg0/TjrIeO5BcNpOewAMRhaXtC4aAXKGYFpAYTSnYRCGq/hyK+NHsSqEpNfH6AVIqx8yxpBY+gpyVQffh85vr8tHYq5nxuCLRziQQwVTY5prnyt0IrvamK4cBAvsHwrbXdblmouXH/a8nJQhWZ9QZO+8STPlmkUTzc09vfqyigHK906G3xR54JlK5sup7K/irbypu/ksuUxFcvJAhYJQOuj9fSRRsZai9jeVKVI5bsFhr9OoaiRc4/oIT1rGQhLTe45jtVgvAsHeIs9JAA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BN8PR06MB5714.namprd06.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(6916009)(5660300002)(966005)(33656002)(4326008)(66476007)(36756003)(64756008)(66946007)(316002)(8936002)(54906003)(2906002)(186003)(478600001)(6506007)(6486002)(66556008)(2616005)(53546011)(66446008)(83380400001)(91956017)(76116006)(26005)(71200400001)(107886003)(8676002)(86362001)(6512007);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: TZB9ddCBqPwqi8Cetql2uxpgVmcFki2psd1qOaoEhDLS2CyCQhPCd0LEIU2GwD599vUslxk+uBlBgYE+5cw221zu+3bADQwLbAiu60A1ghfhZ6bz/5cjqefGG9dSUPjJz8crmpu1u9yN1BzReoZJtXWYVc02p4NSZrBXCtzR5RjHEdadTq7iIQV5DEmnforrMe+b9Bpkkf4xBwPOFw3vdKGa4+uSR/II+SyB+gh9+OmckCZ3AC3jRv1gfAIpRaxDsa9gF4cCIuNsm/w1//+pSWABEQV16O5t6OY0h3cmNkvvY+QWigeK85E//XDr621gT3jEXsHmzXPwDf0YZVtkrKoSjeAohAUz1esc76pWxmOy1WIQ1QcxIfQCWppwZr8/EjSaKy+FH+McEiDbcYQGCqN+lL1aSEo0nYmy8QF0a+8widO7cp3Eufh0U/M4LSfVX4cBqWZEvTRcee68WKH1e0qSoUleBjrncTT+BXG3xmjzW5QCBEuti5G+nrS9uowNMDzHb5wJf7WQ9UETvvE9kK0hkCpfU0HvZWZ75+kAlqhUHWer7AzTpuuQbkluMNr0lKHzwBtzv8lp3a/lXkJgyEBblBwSXT0t26seLtpQrX9R37MyjB3giHrENlyZ/ZhhDnBRrd5u7S5qB2UXqV4QNQ==
Content-ID: <5E473B514C6C5E4FB04E642ABC4C6758@namprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: netapp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR06MB5714.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3e2439-295a-4a31-98d2-08d83fa1d883
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2020 15:59:22.5913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b0911a0-929b-4715-944b-c03745165b3a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LHeCsoSmcoH+5z/mjBaWw/hfgau5QCtk0gEs7p58CmxZxCstDByCz39dkKHN4H2FkCfkDh2PiNJNn8w4v+pSCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR06MB4004
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07DFxccO030439
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 14 Aug 2020 03:04:01 -0400
Cc: Sagi Grimberg <sagi@grimberg.me>, Christoph,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Hellwig <hch@infradead.org>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Chao Leng <lengchao@huawei.com>, Keith Busch <kbusch@kernel.org>,
	"Meneghini, John" <John.Meneghini@netapp.com>,
	Ewan Milne <emilne@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhdCB3b3JrcyBNaWtlLiAKClVuZm9ydHVuYXRlbHksIEkgaGF2ZSB0byB3b3JrIHdpdGggdGhl
IGNvcnBvcmF0ZSBNUyBvZmZpY2UgZW1haWwgaGFuZGxlciAod2hpY2ggc3Vja3MpICBhbmQgZG93
bmxvYWRpbmcgdGhlIC5wYXRjaCBmaWxlIHdvcmtzIG11Y2ggYmV0dGVyIGZvciBtZS4KClRoYW5r
cywKCi9Kb2huCgrvu79PbiA4LzEzLzIwLCAxMTo0MyBBTSwgIk1pa2UgU25pdHplciIgPHNuaXR6
ZXJAcmVkaGF0LmNvbT4gd3JvdGU6CgogICAgTWF5YmUgYmVjYXVzZSBJIGRpZG4ndCBjYyBsaW51
eC1ibG9jaz8KICAgIE9ubHkgd2F5IHRoYXQgSSBrbm93IHRvICJ1cGxvYWQgdGhpcyBwYXRjaCB0
aGVyZSIgaXMgdG8gaGF2ZSBjYydkCiAgICBsaW51eC1ibG9jay4KCiAgICBCdXQgdGhlIHBhdGNo
IGlzIGluIGRtLWRldmVsJ3MgcGF0Y2h3b3JrIGhlcmU6CiAgICBodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3BhdGNoLzExNzEyNTYzLwoKICAgIElzIHRoYXQgc3VmZmljaWVudCBmb3IgeW91
ciBuZWVkcz8KCiAgICBUaGFua3MsCiAgICBNaWtlCgogICAgT24gVGh1LCBBdWcgMTMgMjAyMCBh
dCAxMToyOWFtIC0wNDAwLAogICAgTWVuZWdoaW5pLCBKb2huIDxKb2huLk1lbmVnaGluaUBuZXRh
cHAuY29tPiB3cm90ZToKCiAgICA+IE1pa2UsCiAgICA+CiAgICA+IEkgZG9uJ3Qgc2VlIHlvdXIg
cGF0Y2ggYXQ6CiAgICA+CiAgICA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVj
dC9saW51eC1ibG9jay9saXN0Lz9zdWJtaXR0ZXI9MTY0MwogICAgPgogICAgPiBDYW4geW91IHBs
ZWFzZSB1cGxvYWQgdGhpcyBwYXRjaCB0aGVyZT8KICAgID4KICAgID4gVGhhbmtzLAogICAgPgog
ICAgPiAvSm9obgogICAgPgogICAgPiBPbiA4LzEzLzIwLCAxMDo0OCBBTSwgIk1pa2UgU25pdHpl
ciIgPHNuaXR6ZXJAcmVkaGF0LmNvbT4gd3JvdGU6CiAgICA+CiAgICA+ICAgICBDb21taXQgNzY0
ZTkzMzIwOThjMCAoIm52bWUtbXVsdGlwYXRoOiBkbyBub3QgcmVzZXQgb24gdW5rbm93bgogICAg
PiAgICAgc3RhdHVzIiksIGFtb25nIG90aGVyIHRoaW5ncywgZml4ZWQgTlZNRV9TQ19DTURfSU5U
RVJSVVBURUQgZXJyb3IKICAgID4gICAgIGhhbmRsaW5nIGJ5IGNoYW5naW5nIG11bHRpcGF0aGlu
ZydzIG52bWVfZmFpbG92ZXJfcmVxKCkgdG8gc2hvcnQtY2lyY3VpdAogICAgPiAgICAgcGF0aCBm
YWlsb3ZlciBhbmQgdGhlbiBmYWxsYmFjayB0byBOVk1lJ3Mgbm9ybWFsIGVycm9yIGhhbmRsaW5n
ICh3aGljaAogICAgPiAgICAgdGFrZXMgY2FyZSBvZiBOVk1FX1NDX0NNRF9JTlRFUlJVUFRFRCku
CiAgICA+CiAgICA+ICAgICBUaGlzIGRldG91ciB0aHJvdWdoIG5hdGl2ZSBOVk1lIG11bHRpcGF0
aGluZyBjb2RlIGlzIHVud2VsY29tZSBiZWNhdXNlCiAgICA+ICAgICBpdCBwcmV2ZW50cyBOVk1l
IGNvcmUgZnJvbSBoYW5kbGluZyBOVk1FX1NDX0NNRF9JTlRFUlJVUFRFRCBpbmRlcGVuZGVudAog
ICAgPiAgICAgb2YgYW55IG11bHRpcGF0aGluZyBjb25jZXJucy4KICAgID4KICAgID4gICAgIElu
dHJvZHVjZSBudm1lX3N0YXR1c19uZWVkc19sb2NhbF9lcnJvcl9oYW5kbGluZygpIHRvIHByaW9y
aXRpemUKICAgID4gICAgIG5vbi1mYWlsb3ZlciByZXRyeSwgd2hlbiBhcHByb3ByaWF0ZSwgaW4g
dGVybXMgb2Ygbm9ybWFsIE5WTWUgZXJyb3IKICAgID4gICAgIGhhbmRsaW5nLiAgbnZtZV9zdGF0
dXNfbmVlZHNfbG9jYWxfZXJyb3JfaGFuZGxpbmcoKSB3aWxsIG5hdHVyZWx5IGV2b2x2ZQogICAg
PiAgICAgdG8gaW5jbHVkZSBoYW5kbGluZyBvZiBhbnkgb3RoZXIgZXJyb3JzIHRoYXQgbm9ybWFs
IGVycm9yIGhhbmRsaW5nIG11c3QKICAgID4gICAgIGJlIHVzZWQgZm9yLgogICAgPgogICAgPiAg
ICAgbnZtZV9mYWlsb3Zlcl9yZXEoKSdzIGFiaWxpdHkgdG8gZmFsbGJhY2sgdG8gbm9ybWFsIE5W
TWUgZXJyb3IgaGFuZGxpbmcKICAgID4gICAgIGhhcyBiZWVuIHByZXNlcnZlZCBiZWNhdXNlIGl0
IG1heSBiZSB1c2VmdWwgZm9yIGZ1dHVyZSBOVk1FX1NDIHRoYXQKICAgID4gICAgIG52bWVfc3Rh
dHVzX25lZWRzX2xvY2FsX2Vycm9yX2hhbmRsaW5nKCkgaGFzbid0IGJlZW4gdHJhaW5lZCBmb3Ig
eWV0LgogICAgPgogICAgPiAgICAgU2lnbmVkLW9mZi1ieTogTWlrZSBTbml0emVyIDxzbml0emVy
QHJlZGhhdC5jb20+CiAgICA+ICAgICAtLS0KICAgID4gICAgICBkcml2ZXJzL252bWUvaG9zdC9j
b3JlLmMgfCAxNiArKysrKysrKysrKysrKy0tCiAgICA+ICAgICAgMSBmaWxlIGNoYW5nZWQsIDE0
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAgICA+CiAgICA+ICAgICBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9udm1lL2hvc3QvY29yZS5jIGIvZHJpdmVycy9udm1lL2hvc3QvY29yZS5jCiAg
ICA+ICAgICBpbmRleCA4OGNmZjMwOWQ4ZTQuLmJlNzQ5YjY5MGFmNyAxMDA2NDQKICAgID4gICAg
IC0tLSBhL2RyaXZlcnMvbnZtZS9ob3N0L2NvcmUuYwogICAgPiAgICAgKysrIGIvZHJpdmVycy9u
dm1lL2hvc3QvY29yZS5jCiAgICA+ICAgICBAQCAtMjUyLDYgKzI1MiwxNiBAQCBzdGF0aWMgaW5s
aW5lIGJvb2wgbnZtZV9yZXFfbmVlZHNfcmV0cnkoc3RydWN0IHJlcXVlc3QgKnJlcSkKICAgID4g
ICAgICAgICAgICAgcmV0dXJuIHRydWU7CiAgICA+ICAgICAgfQogICAgPgogICAgPiAgICAgK3N0
YXRpYyBpbmxpbmUgYm9vbCBudm1lX3N0YXR1c19uZWVkc19sb2NhbF9lcnJvcl9oYW5kbGluZyh1
MTYgc3RhdHVzKQogICAgPiAgICAgK3sKICAgID4gICAgICsgICAgICAgc3dpdGNoIChzdGF0dXMg
JiAweDdmZikgewogICAgPiAgICAgKyAgICAgICBjYXNlIE5WTUVfU0NfQ01EX0lOVEVSUlVQVEVE
OgogICAgPiAgICAgKyAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwogICAgPiAgICAgKyAgICAg
ICBkZWZhdWx0OgogICAgPiAgICAgKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKICAgID4g
ICAgICsgICAgICAgfQogICAgPiAgICAgK30KICAgID4gICAgICsKICAgID4gICAgICBzdGF0aWMg
dm9pZCBudm1lX3JldHJ5X3JlcShzdHJ1Y3QgcmVxdWVzdCAqcmVxKQogICAgPiAgICAgIHsKICAg
ID4gICAgICAgICAgICAgc3RydWN0IG52bWVfbnMgKm5zID0gcmVxLT5xLT5xdWV1ZWRhdGE7CiAg
ICA+ICAgICBAQCAtMjcwLDcgKzI4MCw4IEBAIHN0YXRpYyB2b2lkIG52bWVfcmV0cnlfcmVxKHN0
cnVjdCByZXF1ZXN0ICpyZXEpCiAgICA+CiAgICA+ICAgICAgdm9pZCBudm1lX2NvbXBsZXRlX3Jx
KHN0cnVjdCByZXF1ZXN0ICpyZXEpCiAgICA+ICAgICAgewogICAgPiAgICAgLSAgICAgICBibGtf
c3RhdHVzX3Qgc3RhdHVzID0gbnZtZV9lcnJvcl9zdGF0dXMobnZtZV9yZXEocmVxKS0+c3RhdHVz
KTsKICAgID4gICAgICsgICAgICAgdTE2IG52bWVfc3RhdHVzID0gbnZtZV9yZXEocmVxKS0+c3Rh
dHVzOwogICAgPiAgICAgKyAgICAgICBibGtfc3RhdHVzX3Qgc3RhdHVzID0gbnZtZV9lcnJvcl9z
dGF0dXMobnZtZV9zdGF0dXMpOwogICAgPgogICAgPiAgICAgICAgICAgICB0cmFjZV9udm1lX2Nv
bXBsZXRlX3JxKHJlcSk7CiAgICA+CiAgICA+ICAgICBAQCAtMjgwLDcgKzI5MSw4IEBAIHZvaWQg
bnZtZV9jb21wbGV0ZV9ycShzdHJ1Y3QgcmVxdWVzdCAqcmVxKQogICAgPiAgICAgICAgICAgICAg
ICAgICAgIG52bWVfcmVxKHJlcSktPmN0cmwtPmNvbXBfc2VlbiA9IHRydWU7CiAgICA+CiAgICA+
ICAgICAgICAgICAgIGlmICh1bmxpa2VseShzdGF0dXMgIT0gQkxLX1NUU19PSyAmJiBudm1lX3Jl
cV9uZWVkc19yZXRyeShyZXEpKSkgewogICAgPiAgICAgLSAgICAgICAgICAgICAgIGlmICgocmVx
LT5jbWRfZmxhZ3MgJiBSRVFfTlZNRV9NUEFUSCkgJiYgbnZtZV9mYWlsb3Zlcl9yZXEocmVxKSkK
ICAgID4gICAgICsgICAgICAgICAgICAgICBpZiAoIW52bWVfc3RhdHVzX25lZWRzX2xvY2FsX2Vy
cm9yX2hhbmRsaW5nKG52bWVfc3RhdHVzKSAmJgogICAgPiAgICAgKyAgICAgICAgICAgICAgICAg
ICAocmVxLT5jbWRfZmxhZ3MgJiBSRVFfTlZNRV9NUEFUSCkgJiYgbnZtZV9mYWlsb3Zlcl9yZXEo
cmVxKSkKICAgID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsKICAgID4KICAg
ID4gICAgICAgICAgICAgICAgICAgICBpZiAoIWJsa19xdWV1ZV9keWluZyhyZXEtPnEpKSB7CiAg
ICA+ICAgICAtLQogICAgPiAgICAgMi4xOC4wCiAgICA+CiAgICA+CgoKCi0tCmRtLWRldmVsIG1h
aWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFp
bG1hbi9saXN0aW5mby9kbS1kZXZlbA==

