Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 45549E9915
	for <lists+dm-devel@lfdr.de>; Wed, 30 Oct 2019 10:21:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572427265;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lMoYd8cMsiHA8TrU1XWzp5YxFDVSDyMvqVfHlxG7qG4=;
	b=dsLCToQ+kPVvz2LM5CRt9aMf8SJYDDyTj8cQojtTb6Kgn/YXaSgs7TSOQl4o/IY5ievzVe
	uKRFMztK8GoR8bcbT6K+xgJleqOEEbt/Knr8tnB2voSbtz/AYHhkbfuMgvkFc/lUKqeh4j
	xVBZlA9hK9/IAsJeXt2iJsMeWUdaSUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-GNLfWOhoOG2QiGXVqAqcWA-1; Wed, 30 Oct 2019 05:20:51 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD2A985B6F1;
	Wed, 30 Oct 2019 09:20:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85F26600F6;
	Wed, 30 Oct 2019 09:20:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 97DEB3FB40;
	Wed, 30 Oct 2019 09:20:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9TCDMdg003695 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 29 Oct 2019 08:13:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AC65160C4B; Tue, 29 Oct 2019 12:13:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx25.extmail.prod.ext.phx2.redhat.com
	[10.5.110.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5A4460BF1
	for <dm-devel@redhat.com>; Tue, 29 Oct 2019 12:13:20 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7CA1810C092B
	for <dm-devel@redhat.com>; Tue, 29 Oct 2019 12:13:19 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t16so13403321wrr.1
	for <dm-devel@redhat.com>; Tue, 29 Oct 2019 05:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=XYis85XXQhcd2SkQXzhhTcjdkLmbB4AJeu/17MYU70E=;
	b=Q1NnRT9OvzwWvHhVPAV0XDHuYefuqs+otK4YaKqFv7ZBWn8XC5/SnPh3e36tgI+W6K
	DvquMi8ts9w/l8UzKJYvnQ4RAh+B1Cwy8sr7v4dvzKQMW5wqmGlTZlK9q/0fx6a2vibt
	tx4nW9yAP/g3IKc51M57jaMAhLoS95pxfqjStvgIcSmYTQ2frwSRgFW4TldRpbqovEut
	qJRY7GyQVm+TzinmyKmwi7sQSqlnYAKBVUCQsG7QND3Cnh/xHVlg7EFuAqlMuuwYut9L
	NqVDRf+A+5G+XtyTsJrPsBhW16TUFludZdwAmfIY8RBeDhUQ7PMKmsAuSCxLLFRLy+nC
	esLA==
X-Gm-Message-State: APjAAAWz+SFylQvTT/PO6I+DWMo12G8Od+CrGfuZuub40+FzZPFvihmt
	4P1T5Hi0D8jg4NUPhIRatpkusg==
X-Google-Smtp-Source: APXvYqxYNZl6KADg03qJIEP+vtpqMpRTmeTJBC0MGbnAV8ZdmD8Gf4I3Y1BqR0OGyyksPz3If0R3Cg==
X-Received: by 2002:a5d:6203:: with SMTP id y3mr19765135wru.142.1572351198151; 
	Tue, 29 Oct 2019 05:13:18 -0700 (PDT)
Received: from localhost ([194.62.217.57])
	by smtp.gmail.com with ESMTPSA id p1sm2533019wmg.11.2019.10.29.05.13.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 29 Oct 2019 05:13:17 -0700 (PDT)
Date: Tue, 29 Oct 2019 13:13:16 +0100
From: Javier =?utf-8?B?R29uesOhbGV6?= <javier@javigon.com>
To: Damien Le Moal <damien.lemoal@wdc.com>
Message-ID: <20191029121316.o7o7cjurn6qp2gse@MacBook-Pro.gnusmas>
References: <20191027140549.26272-1-damien.lemoal@wdc.com>
	<20191027140549.26272-2-damien.lemoal@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20191027140549.26272-2-damien.lemoal@wdc.com>
User-Agent: NeoMutt/20180716
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.66]);
	Tue, 29 Oct 2019 12:13:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]);
	Tue, 29 Oct 2019 12:13:19 +0000 (UTC) for IP:'209.85.221.66'
	DOMAIN:'mail-wr1-f66.google.com' HELO:'mail-wr1-f66.google.com'
	FROM:'javier@javigon.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.221.66 mail-wr1-f66.google.com 209.85.221.66
	mail-wr1-f66.google.com <javier@javigon.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.66
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 30 Oct 2019 05:20:21 -0400
Cc: Jens Axboe <axboe@kernel.dk>, Ajay Joshi <ajay.joshi@wdc.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Dmitry Fomichev <dmitry.fomichev@wdc.com>,
	Hans Holmberg <Hans.Holmberg@wdc.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-scsi@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
	Matias Bjorling <matias.bjorling@wdc.com>
Subject: Re: [dm-devel] [PATCH 1/8] block: Remove REQ_OP_ZONE_RESET plugging
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
X-MC-Unique: GNLfWOhoOG2QiGXVqAqcWA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gMjcuMTAuMjAxOSAyMzowNSwgRGFtaWVuIExlIE1vYWwgd3JvdGU6Cj5SRVFfT1BfWk9ORV9S
RVNFVCBvcGVyYXRpb25zIGNhbm5vdCBiZSBtZXJnZWQgYXMgdGhlc2UgYmlvcyBhbmQgcmVxdWVz
dHMKPmRvIG5vdCBoYXZlIGEgc2l6ZSBhbmQgYXJlIG5ldmVyIHNlcXVlbnRpYWwgZHVlIHRvIHRo
ZSB6b25lIHN0YXJ0IHNlY3Rvcgo+cG9zaXRpb24gcmVxdWlyZWQgZm9yIHRoZWlyIGV4ZWN1dGlv
bi4gQXMgYSByZXN1bHQsIHRoZXJlIGlzIG5vIHBvaW50IGluCj51c2luZyBhIHBsdWcgYXJvdW5k
IGJsa2Rldl9yZXNldF96b25lcygpIGJpbyBpc3N1aW5nIGxvb3AuIFRoaXMgcGF0Y2gKPnJlbW92
ZXMgdGhpcyB1bm5lY2Vzc2FyeSBwbHVnZ2luZy4KPgo+U2lnbmVkLW9mZi1ieTogRGFtaWVuIExl
IE1vYWwgPGRhbWllbi5sZW1vYWxAd2RjLmNvbT4KPi0tLQo+IGJsb2NrL2Jsay16b25lZC5jIHwg
NCAtLS0tCj4gMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCj4KPmRpZmYgLS1naXQgYS9i
bG9jay9ibGstem9uZWQuYyBiL2Jsb2NrL2Jsay16b25lZC5jCj5pbmRleCA0YmM1ZjI2MDI0OGEu
LjdmZTM3NmVlZGU4NiAxMDA2NDQKPi0tLSBhL2Jsb2NrL2Jsay16b25lZC5jCj4rKysgYi9ibG9j
ay9ibGstem9uZWQuYwo+QEAgLTI1OCw3ICsyNTgsNiBAQCBpbnQgYmxrZGV2X3Jlc2V0X3pvbmVz
KHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsCj4gCXNlY3Rvcl90IHpvbmVfc2VjdG9yczsKPiAJ
c2VjdG9yX3QgZW5kX3NlY3RvciA9IHNlY3RvciArIG5yX3NlY3RvcnM7Cj4gCXN0cnVjdCBiaW8g
KmJpbyA9IE5VTEw7Cj4tCXN0cnVjdCBibGtfcGx1ZyBwbHVnOwo+IAlpbnQgcmV0Owo+Cj4gCWlm
ICghYmxrX3F1ZXVlX2lzX3pvbmVkKHEpKQo+QEAgLTI4Myw3ICsyODIsNiBAQCBpbnQgYmxrZGV2
X3Jlc2V0X3pvbmVzKHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsCj4gCSAgICBlbmRfc2VjdG9y
ICE9IGJkZXYtPmJkX3BhcnQtPm5yX3NlY3RzKQo+IAkJcmV0dXJuIC1FSU5WQUw7Cj4KPi0JYmxr
X3N0YXJ0X3BsdWcoJnBsdWcpOwo+IAl3aGlsZSAoc2VjdG9yIDwgZW5kX3NlY3Rvcikgewo+Cj4g
CQliaW8gPSBibGtfbmV4dF9iaW8oYmlvLCAwLCBnZnBfbWFzayk7Cj5AQCAtMzAxLDggKzI5OSw2
IEBAIGludCBibGtkZXZfcmVzZXRfem9uZXMoc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwKPiAJ
cmV0ID0gc3VibWl0X2Jpb193YWl0KGJpbyk7Cj4gCWJpb19wdXQoYmlvKTsKPgo+LQlibGtfZmlu
aXNoX3BsdWcoJnBsdWcpOwo+LQo+IAlyZXR1cm4gcmV0Owo+IH0KPiBFWFBPUlRfU1lNQk9MX0dQ
TChibGtkZXZfcmVzZXRfem9uZXMpOwo+LS0gCj4yLjIxLjAKPgoKTG9va3MgZ29vZCB0byBtZS4K
ClJldmlld2VkLWJ5OiBKYXZpZXIgR29uesOhbGV6IDxqYXZpZXJAamF2aWdvbi5jb20+CgotLQpk
bS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRo
YXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

