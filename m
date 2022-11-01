Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4099C61478F
	for <lists+dm-devel@lfdr.de>; Tue,  1 Nov 2022 11:15:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667297733;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p+RlVzvLTHnVHaIYFBUw1H32N90Sd9UJ3Y80Yir/Qss=;
	b=I03z8yBCaXfVtgwt/WDfu+fGhSPk+T4M5o0/qrefLeQrZSoHIJ/i6KtFXHCx4yjplVz5M/
	nqe0j8WJfnhuE7HGIlSJ9w8jY/m6p8d/P6gCPAkEHUG/0zzqFaYDhxvCKDQ17sr9QD5FN6
	OBXkF7879SZZsa9rmQdd3t1af7JDY6Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-GYz7z07UP6WR5RoUfwbibA-1; Tue, 01 Nov 2022 06:15:31 -0400
X-MC-Unique: GYz7z07UP6WR5RoUfwbibA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5ED7A800159;
	Tue,  1 Nov 2022 10:15:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A8F98492B0B;
	Tue,  1 Nov 2022 10:15:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 27BCA1946A49;
	Tue,  1 Nov 2022 10:15:21 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 63DB31946594
 for <dm-devel@listman.corp.redhat.com>; Tue,  1 Nov 2022 10:15:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 517C7C1912A; Tue,  1 Nov 2022 10:15:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A5E4C15BA5
 for <dm-devel@redhat.com>; Tue,  1 Nov 2022 10:15:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30A1729ABA13
 for <dm-devel@redhat.com>; Tue,  1 Nov 2022 10:15:19 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-4vUQ8z25NXixPhqPIbFAXQ-1; Tue, 01 Nov 2022 06:15:16 -0400
X-MC-Unique: 4vUQ8z25NXixPhqPIbFAXQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id B77FD68AA6; Tue,  1 Nov 2022 11:15:11 +0100 (CET)
Date: Tue, 1 Nov 2022 11:15:11 +0100
From: Christoph Hellwig <hch@lst.de>
To: Mike Christie <michael.christie@oracle.com>
Message-ID: <20221101101511.GA13304@lst.de>
References: <20221026231945.6609-1-michael.christie@oracle.com>
 <20221026231945.6609-13-michael.christie@oracle.com>
 <20221030082020.GC4774@lst.de>
 <a7e447b5-b26e-7aa0-ab6a-3463b8497d26@oracle.com>
MIME-Version: 1.0
In-Reply-To: <a7e447b5-b26e-7aa0-ab6a-3463b8497d26@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [dm-devel] [PATCH v3 12/19] block, nvme, scsi,
 dm: Add blk_status to pr_ops callouts
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, chaitanyak@nvidia.com,
 martin.petersen@oracle.com, linux-scsi@vger.kernel.org, snitzer@kernel.org,
 linux-nvme@lists.infradead.org, james.bottomley@hansenpartnership.com,
 dm-devel@redhat.com, target-devel@vger.kernel.org, kbusch@kernel.org,
 Christoph Hellwig <hch@lst.de>, bvanassche@acm.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gU3VuLCBPY3QgMzAsIDIwMjIgYXQgMDY6MDU6MzVQTSAtMDUwMCwgTWlrZSBDaHJpc3RpZSB3
cm90ZToKPiBUaGUgcHJvYmxlbSBJIGhpdCBpcyB0aGF0IGluIHRoZSBpb2N0bCBjb2RlIEkgdGhl
biBoYXZlIHRvIGRvOgo+IAo+IEBAIC0yNjksNyArMjcwLDE0IEBAIHN0YXRpYyBpbnQgYmxrZGV2
X3ByX3JlZ2lzdGVyKHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsCj4gIAo+ICAJaWYgKHJlZy5m
bGFncyAmIH5QUl9GTF9JR05PUkVfS0VZKQo+ICAJCXJldHVybiAtRU9QTk9UU1VQUDsKPiAtCXJl
dHVybiBvcHMtPnByX3JlZ2lzdGVyKGJkZXYsIHJlZy5vbGRfa2V5LCByZWcubmV3X2tleSwgcmVn
LmZsYWdzKTsKPiArCXJldCA9IG9wcy0+cHJfcmVnaXN0ZXIoYmRldiwgcmVnLm9sZF9rZXksIHJl
Zy5uZXdfa2V5LCByZWcuZmxhZ3MpOwo+ICsJaWYgKHJldCA9PSAtRUJBREUpIHsKPiArCQlpZiAo
YmRldl9pc19udm1lKGJkZXYpKQo+ICsJCQlyZXQgPSBOVk1FX1NDX1JFU0VSVkFUSU9OX0NPTkZM
SUNUOwo+ICsJCWVsc2UgaWYgKGJkZXZfaXNfc2NzaShiZGV2KQo+ICsJCQlyZXQgPSBTQU1fU1RB
VF9SRVNFUlZBVElPTl9DT05GTElDVDsKPiArCX0KPiArCXJldHVybiByZXQ7CgpFd3cuICBXZSBz
aG91bGQgaGF2ZSBuZXZlciBsZWFrZWQgcHJvdG9jb2wgc3BlY2lmaWMgdmFsdWVzIG91dCB0bwp1
c2Vyc3BhY2UuICBUaGlzIGlzIGFuIG9yaWdpbmFsIGJ1ZyBJIGludHJvZHVjZdGVLCBzbyBhbGwg
YmxhbWUgaXMgb24gbWUuCgpJIHN1c3BlY3QgdGhlIHJpZ2h0IHdheSB0byBmaXggaXMgaXMgdG8g
a2VlcCB0aGUgbnVtZXJpYyB2YWx1ZSBvZgpTQU1fU1RBVF9SRVNFUlZBVElPTl9DT05GTElDVCBh
bmQgZ2l2ZSBpdCBhIG5ldyBjb25zdGFudCBleHBvc2VkIGluCnRoZSB1YXBpIGhlYWRlciwgYXNz
dW1pbmcgdGhhdCBTQ1NJIGlzIHRoZSB0aGluZyBwZW9wbGUgYWN0dWFsbHkKdXNlZCB0aGUgUFIg
QVBJIGZvciwgYW5kIG52bWUgd2FzIGp1c3QgYW4gbmljZSBsaXR0bGUgYWRkLW9uLgoKTm93IGlm
IGFuIGVycm5vIHZhbHVlIG9yIGJsa19zdGF0dXNfdCBpcyByZXR1cm5lZCBmcm9tIHRoZSBtZXRo
b2QKc2hvdWxkIG5vdCBtYXR0ZXIgZm9yIHRoaXMgZml4LCBidXQgaW4gdGhlIGxvbmcgcnVuIEkg
dGhpbmsgdGhlCmJsa19zdGF0dXNfdCB3b3VsZCBiZSBjbGVhbmVyIHRoYW4gdGhlIGludCB1c2Vk
IGZvciBlcnJubywgYW5kCnRoYXQgd2lsbCBhbHNvIHByZXZlbnQgdXMgZnJvbSByZXR1cm5pbmcg
YWNjaWRlbnRhbCBub24taW50ZW5kZWQKdmFsdWVzLgoKQnR3LCBJIGFsc28gdGhpbmcgd2Ugc2hv
dWxkIHJlbmFtZSBCTEtfU1RTX05FWFVTIHRvCkJMS19TVFNfUkVTRVJWQVRJT05fQ09ORkxJQ1Qg
KGFzc3VtaW5nIHMzOTAgaXMgb2sgd2l0aCB0aGF0KSwgYXMgdGhhdApoYXMgbXVjaCBiZXR0ZXIg
ZG9jdW1lbnRhcnkgdmFsdWUuCgo+ICsJY2FzZSBCTEtfU1RTX1RSQU5TUE9SVDoKPiArCQlpZiAo
YmRldl9pc19udm1lKGJkZXYpKQo+ICsJCQlyZXQgPSBOVk1FX1NDX0hPU1RfUEFUSF9FUlJPUjsK
PiArCQllbHNlIGlmIChiZGV2X2lzX3Njc2koYmRldikKPiArCQkJcmV0ID0gRElEX1RSQU5TUE9S
VF9GQUlMRkFTVCBvciBESURfVFJBTlNQT1JUX01BUkdJTkFMOwo+ICsJCWJyZWFrOwoKQW5kIHdl
J2xsIG5lZWQgYW4gdWFwaSB2YWx1ZSBmb3IgdGhpcyBhcyB3ZWxsLgoKPiArCWNhc2UgQkxLX1NU
U19OT1RTVVBQOgoKYW5kIG1heWJlIHRoaXMgdW5sZXNzIHdlIGNhbiBqdXN0IGdldCBhd2F5IHdp
dGggdGhlIG5lZ2F0aXZlIGVycm5vCnZhbHVlLgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRt
LWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0
aW5mby9kbS1kZXZlbAo=

