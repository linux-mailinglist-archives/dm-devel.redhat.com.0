Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4A8711A51
	for <lists+dm-devel@lfdr.de>; Fri, 26 May 2023 00:47:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685054865;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PJ3oeOWdfKh1VhG+ut+x0QCrEwALGV1YPe+oOyWgrBc=;
	b=btCrwanKLXMnF18+efFu0/YgvkpVIYfIpfh8AtJs/J+dnbCCMW6vdkufHC70NvGSVL9S0T
	xtPcgXUytg5VRPuV1QN1ZJFoezxv/iCdGSMe6Whn8dtvz+HyOmaBxoU35hiQYh1wDvTf4d
	2c22rcknu553g25FHLjYGEsyMwpNqXE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-YexrvXFDNQ-ibRmNexKUNg-1; Thu, 25 May 2023 18:47:41 -0400
X-MC-Unique: YexrvXFDNQ-ibRmNexKUNg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 902551C03370;
	Thu, 25 May 2023 22:47:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E6ED1200AD47;
	Thu, 25 May 2023 22:47:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C47E119465B9;
	Thu, 25 May 2023 22:47:36 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 931D719465A0
 for <dm-devel@listman.corp.redhat.com>; Thu, 25 May 2023 22:47:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 75F212029F6E; Thu, 25 May 2023 22:47:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E5E12029F6D
 for <dm-devel@redhat.com>; Thu, 25 May 2023 22:47:35 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DD3E8032F1
 for <dm-devel@redhat.com>; Thu, 25 May 2023 22:47:35 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-Vm8PQvmIMi2ulgB6_s2fHg-1; Thu, 25 May 2023 18:47:33 -0400
X-MC-Unique: Vm8PQvmIMi2ulgB6_s2fHg-1
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-97392066d04so6671766b.3
 for <dm-devel@redhat.com>; Thu, 25 May 2023 15:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685054852; x=1687646852;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j6D4P/JK41Ddrow0l0zlRwdkdCpiqpcZbO2AfcEMcPI=;
 b=ScBm9lD38pj5ZtkQnNj5YI8ysHLQxl911Mc9vsoLtcEXw+ZC90CH2OkJPwT2mLUvF2
 JDby7EmXWHirbm22322mG8k8wvgnrnnEQ1EpUpnimFSiBPBZzTh6u956O87s443FtO7l
 LQTwDQMTq4sislp3Z6vK/w1zSoDjsgeaxegeXReisgSWY+pKeJfdT/pLgdCzoxmFuW/G
 QstwJsJWD+HyFuaVmxVOXehnedaeZQSkVUgYoHnZXPG64o/KKBXL826sNbdk41CT549M
 as0Lc5VvZlT6XKATP+i07yLCHeNZTGTfx/8JZDL8aKJpgnRNotx2i1KBZEax5Ctqk0w5
 FhZw==
X-Gm-Message-State: AC+VfDzpuoxjmeSF6qm9mPfUSUsPb5zMFJY82qVS3cJtbL0VfZBBMjaz
 dGYp8cWYGFFYVn200FN2hfk5JCUmKnKCw/grU2FgCA==
X-Google-Smtp-Source: ACHHUZ71HRrOp6MfK+Cw+RJmShDtRB759VvBHCr7evJoSbuNfS+tOKqG+kM7n2MPzvM2d3iPlRupOezJxtTg4j5CL2g=
X-Received: by 2002:a17:907:724f:b0:96f:2b3f:61 with SMTP id
 ds15-20020a170907724f00b0096f2b3f0061mr301197ejc.7.1685054852142; Thu, 25 May
 2023 15:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230518223326.18744-1-sarthakkukreti@chromium.org>
 <ZGb2Xi6O3i2pLam8@infradead.org> <ZGeKm+jcBxzkMXQs@redhat.com>
 <ZGgBQhsbU9b0RiT1@dread.disaster.area> <ZGu0LaQfREvOQO4h@redhat.com>
 <ZGzIJlCE2pcqQRFJ@bfoster> <ZGzbGg35SqMrWfpr@redhat.com>
 <ZG1dAtHmbQ53aOhA@dread.disaster.area>
 <ZG5taYoXDRymo/e9@redhat.com> <ZG9JD+4Zu36lnm4F@dread.disaster.area>
 <ZG+GKwFC7M3FfAO5@redhat.com>
In-Reply-To: <ZG+GKwFC7M3FfAO5@redhat.com>
From: Sarthak Kukreti <sarthakkukreti@chromium.org>
Date: Thu, 25 May 2023 15:47:21 -0700
Message-ID: <CAG9=OMNhCNFhTcktxSMYbc5WXkSZ-vVVPtb4ak6B3Z2-kEVX0Q@mail.gmail.com>
To: Mike Snitzer <snitzer@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [dm-devel] [PATCH v7 0/5] Introduce provisioning primitives
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>,
 Theodore Ts'o <tytso@mit.edu>, dm-devel@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>,
 Brian Foster <bfoster@redhat.com>, Bart Van Assche <bvanassche@google.com>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Joe Thornber <ejt@redhat.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Stefan Hajnoczi <stefanha@redhat.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Jason Wang <jasowang@redhat.com>,
 Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgOTowMOKAr0FNIE1pa2UgU25pdHplciA8c25pdHplckBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgTWF5IDI1IDIwMjMgYXQgIDc6MzlQIC0wNDAw
LAo+IERhdmUgQ2hpbm5lciA8ZGF2aWRAZnJvbW9yYml0LmNvbT4gd3JvdGU6Cj4KPiA+IE9uIFdl
ZCwgTWF5IDI0LCAyMDIzIGF0IDA0OjAyOjQ5UE0gLTA0MDAsIE1pa2UgU25pdHplciB3cm90ZToK
PiA+ID4gT24gVHVlLCBNYXkgMjMgMjAyMyBhdCAgODo0MFAgLTA0MDAsCj4gPiA+IERhdmUgQ2hp
bm5lciA8ZGF2aWRAZnJvbW9yYml0LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+ID4gT24gVHVlLCBN
YXkgMjMsIDIwMjMgYXQgMTE6MjY6MThBTSAtMDQwMCwgTWlrZSBTbml0emVyIHdyb3RlOgo+ID4g
PiA+ID4gT24gVHVlLCBNYXkgMjMgMjAyMyBhdCAxMDowNVAgLTA0MDAsIEJyaWFuIEZvc3RlciA8
YmZvc3RlckByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4gPiA+ID4gT24gTW9uLCBNYXkgMjIsIDIw
MjMgYXQgMDI6Mjc6NTdQTSAtMDQwMCwgTWlrZSBTbml0emVyIHdyb3RlOgo+ID4gPiA+ID4gPiAu
Li4gc2luY2UgSSBhbHNvIGhhcHBlbiB0byB0aGluayB0aGVyZSBpcyBhIHBvdGVudGlhbGx5IGlu
dGVyZXN0aW5nCj4gPiA+ID4gPiA+IGRldmVsb3BtZW50IHBhdGggdG8gbWFrZSB0aGlzIHNvcnQg
b2YgcmVzZXJ2ZSBwb29sIGNvbmZpZ3VyYWJsZSBpbiB0ZXJtcwo+ID4gPiA+ID4gPiBvZiBzaXpl
IGFuZCBhY3RpdmUvaW5hY3RpdmUgc3RhdGUsIHdoaWNoIHdvdWxkIGFsbG93IHRoZSBmcyB0byB1
c2UgYW4KPiA+ID4gPiA+ID4gZW1lcmdlbmN5IHBvb2wgc2NoZW1lIGZvciBtYW5hZ2luZyBtZXRh
ZGF0YSBwcm92aXNpb25pbmcgYW5kIG5vdCBoYXZlIHRvCj4gPiA+ID4gPiA+IHRyYWNrIGFuZCBw
cm92aXNpb24gaW5kaXZpZHVhbCBtZXRhZGF0YSBidWZmZXJzIGF0IGFsbCAoZGVhbGluZyB3aXRo
Cj4gPiA+ID4gPiA+IHVzZXIgZGF0YSBpcyBtdWNoIGVhc2llciB0byBwcm92aXNpb24gZXhwbGlj
aXRseSkuIFNvIHRoZSBzcGFjZQo+ID4gPiA+ID4gPiBpbmVmZmljaWVuY3kgdGhpbmcgaXMgcG90
ZW50aWFsbHkganVzdCBhIHRyYWRlb2ZmIGZvciBzaW1wbGljaXR5LCBhbmQKPiA+ID4gPiA+ID4g
ZmlsZXN5c3RlbXMgdGhhdCB3YW50IG1vcmUgZ3JhbnVsYXJpdHkgZm9yIGJldHRlciBiZWhhdmlv
ciBjb3VsZCBhY2hpZXZlCj4gPiA+ID4gPiA+IHRoYXQgd2l0aCBtb3JlIHdvcmsuIEZpbGVzeXN0
ZW1zIHRoYXQgZG9uJ3Qgd291bGQgYmUgZnJlZSB0byByZWx5IG9uIHRoZQo+ID4gPiA+ID4gPiBz
aW1wbGUvYmFzaWMgbWVjaGFuaXNtIHByb3ZpZGVkIGJ5IGRtLXRoaW4gYW5kIHN0aWxsIGhhdmUg
YmFzaWMgLUVOT1NQQwo+ID4gPiA+ID4gPiBwcm90ZWN0aW9uIHdpdGggdmVyeSBtaW5pbWFsIGNo
YW5nZXMuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoYXQncyBnZXR0aW5nIHRvbyBmYXIgaW50
byB0aGUgd2VlZHMgb24gdGhlIGZ1dHVyZSBiaXRzLCB0aG91Z2guIFRoaXMKPiA+ID4gPiA+ID4g
aXMgZXNzZW50aWFsbHkgOTklIGEgZG0tdGhpbiBhcHByb2FjaCwgc28gSSdtIG1haW5seSBjdXJp
b3VzIGlmIHRoZXJlJ3MKPiA+ID4gPiA+ID4gc3VmZmljaWVudCBpbnRlcmVzdCBpbiB0aGlzIHNv
cnQgb2YgInJlc2VydmUgbW9kZSIgYXBwcm9hY2ggdG8gdHJ5IGFuZAo+ID4gPiA+ID4gPiBjbGVh
biBpdCB1cCBmdXJ0aGVyIGFuZCBoYXZlIGRtIGd1eXMgbG9vayBhdCBpdCwgb3IgaWYgeW91IGd1
eXMgc2VlIGFueQo+ID4gPiA+ID4gPiBvYnZpb3VzIGlzc3VlcyBpbiB3aGF0IGl0IGRvZXMgdGhh
dCBtYWtlcyBpdCBwb3RlbnRpYWxseSBwcm9ibGVtYXRpYywgb3IKPiA+ID4gPiA+ID4gaWYgeW91
IHdvdWxkIGp1c3QgcHJlZmVyIHRvIGdvIGRvd24gdGhlIHBhdGggZGVzY3JpYmVkIGFib3ZlLi4u
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhlIG1vZGVsIHRoYXQgRGF2ZSBkZXRhaWxlZCwgd2hpY2gg
YnVpbGRzIG9uIFJFUV9QUk9WSVNJT04gYW5kIGlzCj4gPiA+ID4gPiBzdGlja3kgKGJ5IHByb3Zp
c2lvbmluZyBzYW1lIGJsb2NrcyBmb3Igc25hcHNob3QpIHNlZW1zIG1vcmUgdXNlZnVsIHRvCj4g
PiA+ID4gPiBtZSBiZWNhdXNlIGl0IGlzIHF1aXRlIHByZWNpc2UuICBUaGF0IHNhaWQsIGl0IGRv
ZXNuJ3QgYWNjb3VudCBmb3IKPiA+ID4gPiA+IGhhcmQgcmVxdWlyZW1lbnRzIHRoYXQgX2FsbF8g
YmxvY2tzIHdpbGwgYWx3YXlzIHN1Y2NlZWQuCj4gPiA+ID4KPiA+ID4gPiBIbW1tLiBNYXliZSBJ
J20gbWlzdW5kZXJzdGFuZGluZyB0aGUgInJlc2VydmUgcG9vbCIgY29udGV4dCBoZXJlLAo+ID4g
PiA+IGJ1dCBJIGRvbid0IHRoaW5rIHdlJ2QgZXZlciBuZWVkIGEgaGFyZCBndWFyYW50ZWUgZnJv
bSB0aGUgYmxvY2sKPiA+ID4gPiBkZXZpY2UgdGhhdCBldmVyeSB3cml0ZSBiaW8gaXNzdWVkIGZy
b20gdGhlIGZpbGVzeXN0ZW0gd2lsbCBzdWNjZWVkCj4gPiA+ID4gd2l0aG91dCBFTk9TUEMuCj4g
PiA+ID4KPiA+ID4gPiBJZiB0aGUgYmxvY2sgZGV2aWNlIGNhbiBwcm92aWRlIGEgZ3VhcmFudGVl
IHRoYXQgYSBwcm92aXNpb25lZCBMQkEKPiA+ID4gPiByYW5nZSBpcyBhbHdheXMgd3JpdGFibGUs
IHRoZW4gZXZlcnl0aGluZyBlbHNlIGlzIGEgZmlsZXN5c3RlbSBsZXZlbAo+ID4gPiA+IG9wdGlt
aXNhdGlvbiBwcm9ibGVtIGFuZCB3ZSBkb24ndCBoYXZlIHRvIGludm9sdmUgdGhlIGJsb2NrIGRl
dmljZQo+ID4gPiA+IGluIGFueSB3YXkuIEFsbCB3ZSBuZWVkIGlzIGEgZmxhZyB3ZSBjYW4gcmVh
ZHkgb3V0IG9mIHRoZSBiZGV2IGF0Cj4gPiA+ID4gbW91bnQgdGltZSB0byBkZXRlcm1pbmUgaWYg
dGhlIGZpbGVzeXN0ZW0gc2hvdWxkIGJlIG9wZXJhdGluZyB3aXRoCj4gPiA+ID4gTEJBIHByb3Zp
c2lvbmluZyBlbmFibGVkLi4uCj4gPiA+ID4KPiA+ID4gPiBlLmcuIElmIHdlIG5lZWQgdG8gInBy
ZS1wcm92aXNpb24iIGEgY2h1bmsgb2YgdGhlIExCQSBzcGFjZSBmb3IKPiA+ID4gPiBmaWxlc3lz
dGVtIG1ldGFkYXRhLCB3ZSBjYW4gZG8gdGhhdCBhaGVhZCBvZiB0aW1lIGFuZCB0cmFjayB0aGUK
PiA+ID4gPiBwcmUtcHJvdmlzaW9uZWQgcmFuZ2UocykgaW4gdGhlIGZpbGVzeXN0ZW0gaXRzZWxm
Lgo+ID4gPiA+Cj4gPiA+ID4gSW4gWEZTLCBUaGF0IGNvdWxkIGJlIGFzIHNpbXBsZSBhcyBoYXZp
bmcgc21hbGwgY2h1bmtzIG9mIGVhY2ggQUcKPiA+ID4gPiByZXNlcnZlZCB0byBtZXRhZGF0YSAo
ZS5nLiBzdGFydCB3aXRoIHRoZSBmaXJzdCAxMDBNQikgYW5kIGxpbWl0aW5nCj4gPiA+ID4gYWxs
IG1ldGFkYXRhIGFsbG9jYXRpb24gZnJlZSBzcGFjZSBzZWFyY2hlcyB0byB0aGF0IHNwZWNpZmlj
IGJsb2NrCj4gPiA+ID4gcmFuZ2UuIFdoZW4gd2UgcnVuIGxvdyBvbiB0aGF0IHNwYWNlLCB3ZSBw
cmUtcHJvdmlzaW9uIGFub3RoZXIgMTAwTUIKPiA+ID4gPiBjaHVuayBhbmQgdGhlbiBhbGxvY2F0
ZSBhbGwgbWV0YWRhdGEgb3V0IG9mIHRoYXQgbmV3IHJhbmdlLiBJZiB3ZQo+ID4gPiA+IHN0YXJ0
IGdldHRpbmcgRU5PU1BDIHRvIHByZS1wcm92aXNpb25pbmcsIHRoZW4gd2UgcmVkdWNlIHRoZSBz
aXplIG9mCj4gPiA+ID4gdGhlIHJlZ2lvbnMgYW5kIGxvZyBsb3cgc3BhY2Ugd2FybmluZ3MgdG8g
dXNlcnNwYWNlLiBJZiB3ZSBjYW4ndAo+ID4gPiA+IHByZS1wcm92aXNpb24gYW55IHNwYWNlIGF0
IGFsbCBhbmQgd2UndmUgY29tcGxldGVseSBydW4gb3V0LCB3ZQo+ID4gPiA+IHNpbXBseSBkZWNs
YXJlIEVOT1NQQyBmb3IgYWxsIGluY29taW5nIG9wZXJhdGlvbnMgdGhhdCByZXF1aXJlCj4gPiA+
ID4gbWV0YWRhdGEgYWxsb2NhdGlvbiB1bnRpbCBwcmUtcHJvdmlzaW9uaW5nIHN1Y2NlZWRzIGFn
YWluLgo+ID4gPgo+ID4gPiBUaGlzIGlzIGJhc2ljYWxseSBzYXlpbmcgdGhlIHNhbWUgdGhpbmcg
YnV0Ogo+ID4gPgo+ID4gPiBJdCBjb3VsZCBiZSB0aGF0IHRoZSBMQkEgc3BhY2UgaXMgZnJhZ21l
bnRlZCBhbmQgc28gZmFsbGluZyBiYWNrIHRvCj4gPiA+IHRoZSBzbWFsbGVzdCByZWdpb24gc2l6
ZSAodGhhdCBtYXRjaGVzIHRoZSB0aGlucCBibG9jayBzaXplKSB3b3VsZCBiZQo+ID4gPiB0aGUg
bGFzdCByZXNvcnQ/ICBUaGVuIGlmL3doZW4gdGhpbnAgY2Fubm90IGV2ZW4gc2VydmljZSBhbGxv
Y2F0aW5nIGEKPiA+ID4gbmV3IGZyZWUgdGhpbiBibG9jaywgZG0tdGhpbnAgd2lsbCB0cmFuc2l0
aW9uIHRvIG91dC1vZi1kYXRhLXNwYWNlCj4gPiA+IG1vZGUuCj4gPgo+ID4gWWVzLCBzb21ldGhp
bmcgb2YgdGhhdCBzb3J0LCB0aG91Z2ggd2UnZCBwcm9iYWJseSBnaXZlIHVwIGlmIHdlCj4gPiBj
YW4ndCBnZXQgYXQgbGVhc3QgbWVnYWJ5dGUgc2NhbGUgcmVzZXJ2YXRpb25zIC0gYSBzaW5nbGUK
PiA+IG1vZGlmaWNhdGlvbiBpbiBYRlMgY2FuIG1vZGlmeSBtYW55IHN0cnVjdHVyZXMgYW5kIHJl
cXVpcmUKPiA+IGFsbG9jYXRpb24gb2YgYSBsb3Qgb2YgbmV3IG1ldGFkYXRhLCBzbyB0aGUgZmls
ZXlzdGVtIGN1dC1vZmYgd291bGQKPiA+IGZvciBtZXRhZGF0YSBwcm92aXNpb25pbmcgZmFpbHVy
ZSB3b3VsZCBiZSBtdWNoIGxhcmdlciB0aGFuIHRoZQo+ID4gZG0tdGhpbnAgcmVnaW9uIHNpemUu
Li4uCj4gPgo+ID4gPiA+IFRoaXMgaXMgYnVpbHQgZW50aXJlbHkgb24gdGhlIHByZW1pc2UgdGhh
dCBvbmNlIHByb2FjdGl2ZSBiYWNraW5nCj4gPiA+ID4gZGV2aWNlIHByb3Zpc2lvbmluZyBmYWls
cywgdGhlIGJhY2tpbmcgZGV2aWNlIGlzIGF0IEVOT1NQQyBhbmQgd2UKPiA+ID4gPiBoYXZlIHRv
IHdhaXQgZm9yIHRoYXQgc2l0dWF0aW9uIHRvIGdvIGF3YXkgYmVmb3JlIGFsbG93aW5nIG5ldyBk
YXRhCj4gPiA+ID4gdG8gYmUgaW5nZXN0ZWQuIEhlbmNlIHRoZSBibG9jayBkZXZpY2UgcmVhbGx5
IGRvZXNuJ3QgbmVlZCB0byBrbm93Cj4gPiA+ID4gYW55dGhpbmcgYWJvdXQgd2hhdCB0aGUgZmls
ZXN5c3RlbSBpcyBkb2luZyBhbmQgdmljZSB2ZXJzYSAtIFRoZQo+ID4gPiA+IGJsb2NrIGRldiBq
dXN0IHNheXMgInllcyIgb3IgIm5vIiBhbmQgdGhlIGZpbGVzeXN0ZW0gaGFuZGxlcwo+ID4gPiA+
IGV2ZXJ5dGhpbmcgZWxzZS4KPiA+ID4KPiA+ID4gWWVzLgo+ID4gPgo+ID4gPiA+IEl0J3Mgd29y
dGggbm90aW5nIHRoYXQgWEZTIGFscmVhZHkgaGFzIGEgY29hcnNlLWdyYWluZWQKPiA+ID4gPiBp
bXBsZW1lbnRhdGlvbiBvZiBwcmVmZXJyZWQgcmVnaW9ucyBmb3IgbWV0YWRhdGEgc3RvcmFnZS4g
SXQgd2lsbAo+ID4gPiA+IGN1cnJlbnRseSBub3QgdXNlIHRob3NlIG1ldGFkYXRhLXByZWZlcnJl
ZCByZWdpb25zIGZvciB1c2VyIGRhdGEKPiA+ID4gPiB1bmxlc3MgYWxsIHRoZSByZW1haW5pbmcg
dXNlciBkYXRhIHNwYWNlIGlzIGZ1bGwuICBIZW5jZSBJJ20gcHJldHR5Cj4gPiA+ID4gc3VyZSB0
aGF0IGEgcHJlLXByb3Zpc2lvbmluZyBlbmhhbmNtZW50IGxpa2UgdGhpcyBjYW4gYmUgZG9uZQo+
ID4gPiA+IGVudGlyZWx5IGluLW1lbW9yeSB3aXRob3V0IHJlcXVpcmluZyBhbnkgbmV3IG9uLWRp
c2sgc3RhdGUgdG8gYmUKPiA+ID4gPiBhZGRlZC4KPiA+ID4gPgo+ID4gPiA+IFN1cmUsIGlmIHdl
IGNyYXNoIGFuZCByZW1vdW50LCB0aGVuIHdlIG1pZ2h0IGNob3NlIGEgZGlmZmVyZW50IExCQQo+
ID4gPiA+IHJlZ2lvbiBmb3IgcHJlLXByb3Zpc2lvbmluZy4gQnV0IHRoYXQncyBub3QgcmVhbGx5
IGEgaHVnZSBkZWFsIGFzIHdlCj4gPiA+ID4gY291bGQgYWxzbyBydW4gYW4gaW50ZXJuYWwgYmFj
a2dyb3VuZCBwb3N0LW1vdW50IGZzdHJpbSBvcGVyYXRpb24gdG8KPiA+ID4gPiByZW1vdmUgYW55
IHVudXNlZCBwcmUtcHJvdmlzaW9uaW5nIHRoYXQgd2FzIGxlZnQgb3ZlciBmcm9tIHdoZW4gdGhl
Cj4gPiA+ID4gc3lzdGVtIHdlbnQgZG93bi4KPiA+ID4KPiA+ID4gVGhpcyB3b3VsZCBiZSB0aGUg
RklUUklNIHdpdGggZXh0ZW5zaW9uIHlvdSBtZW50aW9uIGJlbG93PyBXaGljaCBpcyBhCj4gPiA+
IGZpbGVzeXN0ZW0gaW50ZXJmYWNlIGRldGFpbD8KPiA+Cj4gPiBOby4gV2UgbWlnaHQgcmV1c2Ug
c29tZSBvZiB0aGUgaW50ZXJuYWwgaW5mcmFzdHJ1Y3R1cmUgd2UgdXNlIHRvCj4gPiBpbXBsZW1l
bnQgRklUUklNLCBidXQgdGhhdCdzIGFib3V0IGl0LiBJdCdzIGp1c3Qgc29tZXRoaW5nIGtpbmRh
Cj4gPiBsaWtlIEZJVFJJTSBidXQgd2l0aCBkaWZmZXJlbnQgY29uc3RyYWludHMgZGV0ZXJtaW5l
ZCBieSB0aGUKPiA+IGZpbGVzeXN0ZW0gcmF0aGVyIHRoYW4gdGhlIHVzZXIuLi4KPiA+Cj4gPiBB
cyBpdCBpcywgSSdtIG5vdCBzdXJlIHdlJ2QgZXZlbiBuZWVkIGl0IC0gYSBwcmVpb2RpYyB1c2Vy
c3BhY2UKPiA+IEZJVFJJTSB3b3VsZCBhY2hlaXZlIHRoZSBzYW1lIHJlc3VsdCwgc28gbGVha2Vk
IHByb3Zpc2lvbmVkIHNwYWNlcwo+ID4gd291bGQgZ2V0IGNsZWFuZWQgdXAgZXZlbnR1YWxseSB3
aXRob3V0IHRoZSBmaWxlc3lzdGVtIGhhdmluZyB0byBkbwo+ID4gYW55dGhpbmcgc3BlY2lmaWMu
Li4KPiA+Cj4gPiA+IFNvIGRtLXRoaW5wIHdvdWxkIF9ub3RfIG5lZWQgdG8gaGF2ZSBuZXcKPiA+
ID4gc3RhdGUgdGhhdCB0cmFja3MgInByb3Zpc2lvbmVkIGJ1dCB1bnVzZWQiIGJsb2NrPwo+ID4K
PiA+IE5vIGlkZWEgLSB0aGF0J3MgeW91ciBkb21haW4uIDopCj4gPgo+ID4gZG0tc25hcHNob3Qs
IGZvciBjZXJ0YWluLCB3aWxsIG5lZWQgdG8gdHJhY2sgcHJvdmlzaW9uZWQgcmVnaW9ucwo+ID4g
YmVjYXVzZSBpdCBoYXMgdG8gZ3VhcmFudGVlIHRoYXQgb3ZlcndyaXRlcyB0byBwcm92aXNpb25l
ZCBzcGFjZSBpbgo+ID4gdGhlIG9yaWdpbiBkZXZpY2Ugd2lsbCBhbHdheXMgc3VjY2VlZC4gSGVu
Y2UgaXQgbmVlZHMgdG8ga25vdyBob3cKPiA+IG11Y2ggc3BhY2UgYnJlYWtpbmcgc2hhcmluZyBp
biBwcm92aXNpb25lZCByZWdpb25zIGFmdGVyIGEgc25hcHNob3QKPiA+IGhhcyBiZWVuIHRha2Vu
IHdpdGggYmUgcmVxdWlyZWQuLi4KPgo+IGRtLXRoaW5wIG9mZmVycyBpdHMgb3duIG11Y2ggbW9y
ZSBzY2FsYWJsZSBzbmFwc2hvdCBzdXBwb3J0IChkb2Vzbid0Cj4gdXNlIG9sZCBkbS1zbmFwc2hv
dCBOLXdheSBjb3B5b3V0IHRhcmdldCkuCj4KPiBkbS1zbmFwc2hvdCBpc24ndCBnb2luZyB0byBi
ZSBtb2RpZmllZCB0byBzdXBwb3J0IHRoaXMgbGV2ZWwgb2YKPiBoYXJkZW5pbmcgKGRtLXNuYXBz
aG90IGlzIGJhc2ljYWxseSBpbiAibWFpbnRlbmFuY2Ugb25seSIgbm93KS4KPgo+IEJ1dCBJIHVu
ZGVyc3RhbmQgeW91ciBtZWFuaW5nOiB3aGF0IHlvdSBzYWlkIGlzIDEwMCUgYXBwbGljYWJsZSB0
bwo+IGRtLXRoaW5wJ3Mgc25hcHNob3QgaW1wbGVtZW50YXRpb24gYW5kIG5lZWRzIHRvIGJlIGFj
Y291bnRlZCBmb3IgaW4KPiB0aGlucCdzIG1ldGFkYXRhIChpbmhlcmVudCAncHJvdmlzaW9uZWQn
IGZsYWcpLgo+CkEgYml0IG9ydGhvZ29uYWw6IHdvdWxkIGRtLXRoaW5wIG5lZWQgdG8gZGlmZmVy
ZW50aWF0ZSBiZXR3ZWVuCnVzZXItdHJpZ2dlcmVkIHByb3Zpc2lvbiByZXF1ZXN0cyAoZWcuIGZy
b20gZmFsbG9jYXRlKCkpIHZzCmZzLXRyaWdnZXJlZCByZXF1ZXN0cz8gSSB3b3VsZCBsZWFuIHRv
d2FyZHMgdXNlciBwcm92aXNpb25lZCBhcmVhcyBub3QKZ2V0dGluZyBkZWR1cCdkIG9uIHNuYXBz
aG90IGNyZWF0aW9uLCBidXQgdGhhdCB3b3VsZCBlbnRhaWwgdHJhY2tpbmcKdGhlIHN0YXRlIG9m
IHRoZSBvcmlnaW5hbCByZXF1ZXN0IGFuZCBwb3NzaWJseSBhIHByb3Zpc2lvbiByZXF1ZXN0CmZs
YWcgKFJFUV9QUk9WSVNJT05fREVEVVBfT05fU05BUFNIT1QpIG9yIGFuIGludmVyc2UgZmxhZwoo
UkVRX1BST1ZJU0lPTl9OT0RFRFVQKS4gUG9zc2libHkgdG9vIGNvbnZvbHV0ZWQuLi4KCj4gPiA+
IE5vciB3b3VsZCB0aGUgYmxvY2sKPiA+ID4gbGF5ZXIgbmVlZCBhbiBleHRyYSBkaXNjYXJkIGZs
YWcgZm9yIGEgbmV3IGNsYXNzIG9mICJwcm92aXNpb25lZCIKPiA+ID4gYmxvY2tzLgo+ID4KPiA+
IFJpZ2h0LCBJIGRvbid0IHNlZSB0aGF0IHRoZSBkaXNjYXJkIG9wZXJhdGlvbnMgbmVlZCB0byBj
YXJlIHdoZXRoZXIKPiA+IHRoZSB1bmRlcmx5aW5nIHN0b3JhZ2UgaXMgcHJvdmlzaW9uZWQuIGRt
LXRoaW5wIGFuZCBkbS1zbmFwc2hvdCBjYW4KPiA+IHRyZWF0IFJFUV9PUF9ESVNDQVJEIGFzICJ0
aGlzIHJhbmdlIGlzIG5vdCBsb25nZXIgaW4gdXNlIiBhbmQgZG8KPiA+IHdoYXRldmVyIHRoZXkg
d2FudCB3aXRoIHRoZW0uCj4gPgo+ID4gPiBJZiBYRlMgdHJhY2tlZCB0aGlzICJwcm92aXNpb25l
ZCBidXQgdW51c2VkIiBzdGF0ZSwgZG0tdGhpbnAgY291bGQKPiA+ID4ganVzdCBkaXNjYXJkIHRo
ZSBibG9jayBsaWtlIGl0cyB0b2xkLiAgV291bGQgYmUgbmljZSB0byBhdm9pZCBkbS10aGlucAo+
ID4gPiBuZWVkaW5nIHRvIHRyYWNrICJwcm92aXNpb25lZCBidXQgdW51c2VkIi4KPiA+ID4KPiA+
ID4gVGhhdCBzYWlkLCBkbS10aGlucCBkb2VzIHN0aWxsIG5lZWQgdG8ga25vdyBpZiBhIGJsb2Nr
IHdhcyBwcm92aXNpb25lZAo+ID4gPiAoZ2l2ZW4gb3VyIHByZXZpb3VzIGRlc2lnbmVkIGRpc2N1
c3Npb24sIHRvIGFsbG93IHByb3BlciBndWFyYW50ZWVzCj4gPiA+IGZyb20gdGhpcyBpbnRlcmZh
Y2UgYXQgc25hcHNob3QgdGltZSkgc28gdGhhdCBYRlMgYW5kIG90aGVyCj4gPiA+IGZpbGVzeXN0
ZW1zIGRvbid0IG5lZWQgdG8gcmUtcHJvdmlzaW9uIGFyZWFzIHRoZXkgYWxyZWFkeQo+ID4gPiBw
cmUtcHJvdmlzaW9uZWQuCj4gPgo+ID4gUmlnaHQuCj4gPgo+ID4gSSd2ZSBzaW1wbHkgYXNzdW1l
ZCB0aGF0IGRtLXRoaW5wIHdvdWxkIG5lZWQgdG8gdHJhY2sgZW50aXJlCj4gPiBwcm92aXNpb25l
ZCByZWdpb25zIC0gdXNlZCBvciB1bnVzZWQgLSBzbyBpdCBrbm93cyB3aGljaCB3cml0ZXMgdG8K
PiA+IGVtcHR5IG9yIHNoYXJlZCByZWdpb25zIGhhdmUgYSByZXNlcnZhdGlvbiB0byBhbGxvdyBh
bGxvY2F0aW9uIHRvCj4gPiBzdWNjZWVkIHdoZW4gdGhlIGJhY2tpbmcgcG9vbCBpcyBvdGhlcndp
c2UgZW1wdHkuLi4uLgo+ID4KPiA+ID4gSG93ZXZlciwgaXQgbWF5IGJlIHRoYXQgaWYgdGhpbnAg
ZGlkIHRyYWNrICJwcm92aXNpb25lZCBidXQgdW51c2VkIgo+ID4gPiBpdCdkIGJlIHVzZWZ1bCB0
byBhbGxvdyBzbmFwc2hvdHMgdG8gc2hhcmUgcHJvdmlzaW9uZWQgYmxvY2tzIHRoYXQKPiA+ID4g
d2VyZSBuZXZlciB1c2VkLiAgTWVhbmluZywgd2UgY291bGQgdGhlbiBhdm9pZCAiYnJlYWtpbmcg
c2hhcmluZyIgYXQKPiA+ID4gc25hcHNob3QtdGltZSBmb3IgInByb3Zpc2lvbmVkIGJ1dCB1bnVz
ZWQiIGJsb2Nrcy4gIEJ1dCBhbGxvd2luZyB0aGlzCj4gPiA+ICJvcHRpbWl6YXRpb24iIHVuZGVy
Y3V0cyB0aGUgZ2F1cmFudGVlIHRoYXQgWEZTIG5lZWRzIGZvciB0aGlucAo+ID4gPiBzdG9yYWdl
IHRoYXQgYWxsb3dzIHNuYXBzaG90cy4uLiBTTywgSSB0aGluayBJIGFuc3dlcmVkIG15IG93bgo+
ID4gPiBxdWVzdGlvbjogdGhpbnAgZG9lc250IG5lZWQgdG8gdHJhY2sgInByb3Zpc2lvbmVkIGJ1
dCB1bnVzZWQiIGJsb2Nrcwo+ID4gPiBidXQgd2UgbXVzdCBhbHdheXMgZW5zdXJlIHNuYXBzaG90
cyBpbmhlcml0IHByb3Zpc29uZWQgYmxvY2tzIDspCj4gPgo+ID4gU291bmRzIGxpa2UgYSBwb3Rl
bnRpYWwgb3B0aW1pc2F0aW9uLCBidXQgSSBoYXZlbid0IHRob3VnaHQgdGhyb3VnaAo+ID4gYSBw
b3RlbnRpYWwgc25hcHNob3QgZGV2aWNlIGltcGxlbWVudGF0aW9uIHRoYXQgZmFyIHRvIGNvbW1l
bnQKPiA+IHNhbmVseS4gSSBzdG9wcGVkIG9uY2UgSSBnb3QgdG8gdGhlIHBvaW50IHdoZXJlIGFj
Y291bnRpbmcgdHJpY2tzCj4gPiBjb3VudCBiZSB1c2VkIHRvIGd1YXJhbnRlZSBzcGFjZSBpcyBh
dmFpbGFibGUgZm9yIGJyZWFraW5nIHNoYXJpbmcKPiA+IG9mIHVzZWQgcHJvdmlzaW9uZWQgc3Bh
Y2UgYWZ0ZXIgYSBzbmFwc2hvdCB3YXMgdGFrZW4uLi4uCj4gPgo+ID4gPiA+IEZ1cnRoZXIsIG1h
bmFnaW5nIHNoYXJlZCBwb29sIGV4aGF1c3Rpb24gZG9lc24ndCByZXF1aXJlIGEKPiA+ID4gPiBy
ZXNlcnZhdGlvbiBwb29sIGluIHRoZSBiYWNraW5nIGRldmljZSBhbmQgZm9yIHRoZSBmaWxlc3lz
dGVtcyB0bwo+ID4gPiA+IHJlcXVlc3Qgc3BhY2UgZnJvbSBpdC4gRmlsZXN5c3RlbXMgYWxyZWFk
eSBoYXZlIHRoZWlyIG93biByZXNlcnZlCj4gPiA+ID4gcG9vbHMgdmlhIHByZS1wcm92aXNpb25p
bmcuIElmIHdlIHdhbnQgdGhlIGZpbGVzeXN0ZW1zIHRvIGJlIGFibGUgdG8KPiA+ID4gPiByZWxl
YXNlIHRoYXQgc3BhY2UgYmFjayB0byB0aGUgc2hhcmVkIHBvb2wgKGUuZy4gYmVjYXVzZSB0aGUg
c2hhcmVkCj4gPiA+ID4gYmFja2luZyBwb29sIGlzIGNyaXRpY2FsbHkgc2hvcnQgb24gc3BhY2Up
IHRoZW4gYWxsIHdlIG5lZWQgaXMgYW4KPiA+ID4gPiBleHRlbnNpb24gdG8gRklUUklNIHRvIHRl
bGwgdGhlIGZpbGVzeXN0ZW0gdG8gYWxzbyByZWxlYXNlIGludGVybmFsCj4gPiA+ID4gcHJlLXBy
b3Zpc2lvbmVkIHJlc2VydmVzLgo+ID4gPgo+ID4gPiBTbyBieSBkZWZhdWx0IEZJVFJJTSB3aWxs
IF9ub3RfIGRpc2NhcmQgcHJvdmlzaW9uZWQgYmxvY2tzLiAgT25seSBpZgo+ID4gPiBhIGZsYWcg
aXMgdXNlZCB3aWxsIGl0IHJlc3VsdCBpbiBkaXNjYXJkaW5nIHByb3Zpc2lvbmVkIGJsb2Nrcy4K
PiA+Cj4gPiBOby4gRklUUklNIHJlc3VsdHMgaW4gZGlzY2FyZCBvZiBhbnkgdW51c2VkIGZyZWUg
c3BhY2UgaW4gdGhlCj4gPiBmaWxlc3lzdGVtIHRoYXQgbWF0Y2hlcyB0aGUgY3JpdGVyaWEgc2V0
IGJ5IHRoZSB1c2VyLiBXZSBkb24ndCBjYXJlCj4gPiBpZiBmcmVlIHNwYWNlIHdhcyBvbmNlIHBy
b3Zpc2lvbmVkIHVzZWQgc3BhY2UgLSB3ZSdsbCBpc3N1ZSBhCj4gPiBkaXNjYXJkIGZvciB0aGUg
cmFuZ2UgcmVnYXJkbGVzcy4gVGhlICJzcGVjaWFsIiBGSVRSSU0gZXh0ZW5zaW9uIEkKPiA+IG1l
bnRpb25lZCBpcyB0byBnZXQgZmlsZXN5c3RlbSBtZXRhZGF0YSBwcm92aXNpb25pbmcgcmVsZWFz
ZWQ7Cj4gPiB0aGF0J3MgY29tcGxldGVseSBzZXBhcmF0ZSB0byB1c2VyIGRhdGEgcHJvdmlzaW9u
aW5nIHRocm91Z2gKPiA+IGZhbGxvY2F0ZSgpIHdoaWNoIEZJVFJJTSB3aWxsIGFsd2F5cyBkaXNj
YXJkIGlmIGl0IGhhcyBiZWVuIGZyZWVkLi4uCj4gPgo+ID4gSU9Xcywgbm9ybWFsIGJlaGF2aW91
ciB3aWxsIGJlIHRoYXQgYSBGSVRSSU0gZW5kcyB1cCBkaXNjYXJkaW5nIGEKPiA+IG1peCBvZiB1
bnByb3Zpc2lvbmVkIGFuZCBwcm92aXNpb25lZCBzcGFjZS4gTm9ib2R5IHdpbGwgYmUgYWJsZSB0
bwo+ID4gcHJlZGljdCB3aGF0IG1peCB0aGUgZGV2aWNlIGlzIGdvaW5nIHRvIGdldCBhdCBhbnkg
cG9pbnQgaW4gdGltZS4KPiA+IEFsc28sIGlmIHdlIHR1cm4gb24gb25saW5lIGRpc2NhcmQsIHRo
ZSBibG9jayBkZXZpY2UgaXMgZ29pbmcgdG8gZ2V0Cj4gPiBhIGNvbnN0YW50IHN0cmVhbSBvZiBk
aXNjYXJkIG9wZXJhdGlvbnMgdGhhdCB3aWxsIGFsc28gYmUgYSBtaXggb2YKPiA+IHByb3Zpc2lv
bmVkIGFuZCB1bnByb3Zpc2lvbmVkIHNwYWNlIHRoYXQgaXMgbm90IGxvbmdlciBpbiB1c2UgYnkg
dGhlCj4gPiBmaWxlc3lzdGVtLgo+ID4KPiA+IEkgc3VzcGVjdCB0aGF0IHlvdSBuZWVkIHRvIHN0
b3AgdHJ5aW5nIHRvIGRvdWJsZSBndWVzcyB3aGF0Cj4gPiBvcGVyYXRpb25zIHRoZSBmaWxlc3lz
dGVtIHdpbGwgdXNlIHByb3Zpc2lvbmluZyBmb3IsIHdoYXQgaXQgd2lsbAo+ID4gc2VuZCBkaXNj
YXJkcyBmb3IgYW5kIHdoZW4gaXQgd2lsbCBzZW5kIGRpc2NhcmRzIGZvciB0aGVtLi4gSnVzdAo+
ID4gYXNzdW1lIHRoZSBkZXZpY2Ugd2lsbCByZWNlaXZlIGEgY29uc3RhbnQgc3RyZWFtIG9mIGJv
dGgKPiA+IFJFUV9QUk9WSVNJT04gYW5kIFJFUV9PUF9ESVNDQVJEIChmb3IgYm90aCBwcm92aXNp
b25lZCBhbmQKPiA+IHVucHJvdmlzaW9uZWQgcmVnaW9ucykgb3BlcmF0aW9ucyB3aGVudmVyIHRo
ZSBmaWxlc3lzdGVtIGlzIGFjdGl2ZQo+ID4gb24gYSB0aGlucCBkZXZpY2UuLi4uLgo+Cj4gWWVh
aCwgSSB3YXMgZ2V0dGluZyB0cmlwcGVkIHVwIGluIHRoZSB3ZWVkcyBhIGJpdC4gIEl0J3MgcHJl
dHR5Cj4gc3RyYWlnaHQtZm9yd2FyZCAoYW5kIGxpa2UgSSBzYWlkIGF0IHRoZSBzdGFydCBvZiBv
dXIgc3VidGhyZWFkIGhlcmU6Cj4gdGhpcyBmb2xsb3ctb24gd29yaywgdG8gaW5oZXJpdCBwcm92
aXNpb25lZCBmbGFnLCBjYW4gYnVpbGQgb24gdGhpcwo+IFJFUV9QUk9WSVNJT04gcGF0Y2hzZXQp
Lgo+Cj4gQWxsIHNhaWQsIEkndmUgbm93IGdvdHRlbiB0aGlzIHN1Yi10aHJlYWQgb24gSm9lIFRo
b3JuYmVyJ3MgcmFkYXIgYW5kCj4gd2UndmUgc3RhcnRlZCBkaXNjdXNzaW5nLiBXZSdsbCBiZSBk
aXNjdXNzaW5nIHdpdGggbW9yZSBmb2N1cwo+IHRvbW9ycm93Lgo+CkZyb20gdGhlIHBlcnNwZWN0
aXZlIG9mIHRoaXMgcGF0Y2ggc2VyaWVzLCBJJ2xsIHdhaXQgZm9yIG1vcmUgZmVlZGJhY2sKYmVm
b3JlIHNlbmRpbmcgb3V0IHY4ICh3aGljaCB3b3VsZCBiZSB0aGUgYWJvdmUgcGF0Y2hlcyBhbmQg
dGhlCmZvbGxvdy1vbiBwYXRjaCB0byBwYXNzIHRocm91Z2ggRkFMTE9DX0ZMX1VOU0hBUkVfUkFO
R0UgWzFdKS4KClsxXSBodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9hcmNoaXZlcy9kbS1kZXZl
bC8yMDIzLU1heS8wNTQxODguaHRtbAoKVGhhbmtzIQpTYXJ0aGFrCgo+IE1pa2UKCi0tCmRtLWRl
dmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRo
YXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWwK

