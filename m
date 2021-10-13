Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3E61842C9C2
	for <lists+dm-devel@lfdr.de>; Wed, 13 Oct 2021 21:17:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-S9efdjDjN2SOPOA9MG6B2g-1; Wed, 13 Oct 2021 15:17:01 -0400
X-MC-Unique: S9efdjDjN2SOPOA9MG6B2g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5454D801AA7;
	Wed, 13 Oct 2021 19:16:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07B3D2C175;
	Wed, 13 Oct 2021 19:16:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0517F1800FE4;
	Wed, 13 Oct 2021 19:16:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19DJCuv4018615 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 Oct 2021 15:12:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B7C5240D1B9E; Wed, 13 Oct 2021 19:12:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B22CB40D1B98
	for <dm-devel@redhat.com>; Wed, 13 Oct 2021 19:12:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95E671857F0E
	for <dm-devel@redhat.com>; Wed, 13 Oct 2021 19:12:56 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-475-_jEjrVdEOKWt-s7_C0_wSA-1;
	Wed, 13 Oct 2021 15:12:54 -0400
X-MC-Unique: _jEjrVdEOKWt-s7_C0_wSA-1
Received: from
	linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
	(linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 447A520B9CF8;
	Wed, 13 Oct 2021 12:06:39 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 447A520B9CF8
From: deven.desai@linux.microsoft.com
To: corbet@lwn.net, axboe@kernel.dk, agk@redhat.com, snitzer@redhat.com,
	ebiggers@kernel.org, tytso@mit.edu, paul@paul-moore.com,
	eparis@redhat.com, jmorris@namei.org, serge@hallyn.com
Date: Wed, 13 Oct 2021 12:06:19 -0700
Message-Id: <1634151995-16266-1-git-send-email-deven.desai@linux.microsoft.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 19DJCuv4018615
X-loop: dm-devel@redhat.com
Cc: linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	jannh@google.com, linux-fscrypt@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, linux-audit@redhat.com
Subject: [dm-devel] [RFC PATCH v7 00/16] Integrity Policy Enforcement (IPE)
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RnJvbTogRGV2ZW4gQm93ZXJzIDxkZXZlbi5kZXNhaUBsaW51eC5taWNyb3NvZnQuY29tPgoKT3Zl
cnZpZXc6Ci0tLS0tLS0tLQoKSVBFIGlzIGEgTGludXggU2VjdXJpdHkgTW9kdWxlIHdoaWNoIHRh
a2VzIGEgY29tcGxpbWVudGFyeSBhcHByb2FjaCB0bwphY2Nlc3MgY29udHJvbC4gV2hlcmVhcyBl
eGlzdGluZyBzeXN0ZW1zIGFwcHJvYWNoIHVzZSBsYWJlbHMgb3IgcGF0aHMKd2hpY2ggY29udHJv
bCBhY2Nlc3MgdG8gYSByZXNvdXJjZSwgSVBFIGNvbnRyb2xzIGFjY2VzcyB0byBhIHJlc291cmNl
CmJhc2VkIG9uIHRoZSBzeXN0ZW0ncyB0cnVzdCBvZiBzYWlkIHJlc291cmNlLgoKVHJ1c3QgcmVx
dWlyZW1lbnRzIGFyZSBlc3RhYmxpc2hlZCB2aWEgSVBFJ3MgcG9saWN5LCBzb3VyY2luZyBtdWx0
aXBsZQpkaWZmZXJlbnQgaW1wbGVtZW50YXRpb25zIHdpdGhpbiB0aGUga2VybmVsIHRvIGJ1aWxk
IGEgY29oZXNpdmUgdHJ1c3QKbW9kZWwsIGJhc2VkIG9uIGhvdyB0aGUgc3lzdGVtIHdhcyBidWls
dC4KClRydXN0LCB3aXRoIHJlc3BlY3QgdG8gY29tcHV0aW5nLCBpcyBhIGNvbmNlcHQgdGhhdCBk
ZXNpZ25hdGVzIGEgc2V0Cm9mIGVudGl0aWVzIHdobyB3aWxsIGVuZG9yc2UgYSBzZXQgb2YgcmVz
b3VyY2VzIGFzIG5vbi1tYWxpY2lvdXMuClRyYWRpdGlvbmFsbHksIHRoaXMgaXMgZG9uZSB2aWEg
c2lnbmF0dXJlcywgd2hpY2ggaXMgdGhlIGFjdCBvZiBlbmRvcnNpbmcKYSByZXNvdXJjZS4KCklu
dGVncml0eSwgb24gdGhlIG90aGVyIGhhbmQsIGlzIHRoZSBjb25jZXB0IG9mIGVuc3VyaW5nIHRo
YXQgYSByZXNvdXJjZQpoYXMgbm90IGJlZW4gbW9kaWZpZWQgc2luY2UgYSBwb2ludCBvZiB0aW1l
LiBUaGlzIGlzIHR5cGljYWxseSBkb25lIHRocm91Z2gKY3J5cHRvZ3JhcGhpYyBoYXNoZXMgb3Ig
c2lnbmF0dXJlcy4KClRydXN0IGFuZCBpbnRlZ3JpdHkgYXJlIHZlcnkgY2xvc2VseSB0aWVkIHRv
Z2V0aGVyIGNvbmNlcHRzLCBhcyBpbnRlZ3JpdHkKaXMgdGhlIHdheSB5b3UgY2FuIHByb3ZlIHRy
dXN0IGZvciBhIHJlc291cmNlOyBvdGhlcndpc2UgaXQgY291bGQgaGF2ZQpiZWVuIG1vZGlmaWVk
IGJ5IGFuIGVudGl0eSB3aG8gaXMgdW50cnVzdGVkLgoKSVBFIHByb3ZpZGVzIGEgd2F5IGZvciBh
IHVzZXIgdG8gZXhwcmVzcyB0cnVzdCByZXF1aXJlbWVudHMgb2YgcmVzb3VyY2VzLApieSB1c2lu
ZyBwcmUtZXhpc3Rpbmcgc3lzdGVtcyB3aGljaCBwcm92aWRlIHRoZSBpbnRlZ3JpdHkgaGFsZiBv
ZiB0aGUKZXF1YXRpb24uCgpJUEUgaXMgY29tcGlsZWQgdW5kZXIgQ09ORklHX1NFQ1VSSVRZX0lQ
RS4KClVzZSBDYXNlcwotLS0tLS0tLS0KCklQRSB3b3JrcyBiZXN0IGluIGZpeGVkLWZ1bmN0aW9u
IGRldmljZXM6IERldmljZXMgaW4gd2hpY2ggdGhlaXIgcHVycG9zZQppcyBjbGVhcmx5IGRlZmlu
ZWQgYW5kIG5vdCBzdXBwb3NlZCB0byBiZSBjaGFuZ2VkIChlLmcuIG5ldHdvcmsgZmlyZXdhbGwK
ZGV2aWNlIGluIGEgZGF0YSBjZW50ZXIsIGFuIElvVCBkZXZpY2UsIGV0Y2V0ZXJhKSwgd2hlcmUg
YWxsIHNvZnR3YXJlIGFuZApjb25maWd1cmF0aW9uIGlzIGJ1aWx0IGFuZCBwcm92aXNpb25lZCBi
eSB0aGUgc3lzdGVtIG93bmVyLgoKSVBFIGlzIGEgbG9uZy13YXkgb2ZmIGZvciB1c2UgaW4gZ2Vu
ZXJhbC1wdXJwb3NlIGNvbXB1dGluZzoKdGhlIExpbnV4IGNvbW11bml0eSBhcyBhIHdob2xlIHRl
bmRzIHRvIGZvbGxvdyBhIGRlY2VudHJhbGl6ZWQgdHJ1c3QKbW9kZWwsIGtub3duIGFzIHRoZSBX
ZWIgb2YgVHJ1c3QsIHdoaWNoIElQRSBoYXMgbm8gc3VwcG9ydCBmb3IgYXMgb2YgeWV0LgpJbnN0
ZWFkLCBJUEUgc3VwcG9ydHMgdGhlIFBLSSBUcnVzdCBNb2RlbCwgd2hpY2ggZ2VuZXJhbGx5IGRl
c2lnbmF0ZXMgYQpzZXQgb2YgZW50aXRpZXMgdGhhdCBwcm92aWRlIGEgbWVhc3VyZSBhYnNvbHV0
ZSB0cnVzdC4KCkFkZGl0aW9uYWxseSwgd2hpbGUgbW9zdCBwYWNrYWdlcyBhcmUgc2lnbmVkIHRv
ZGF5LCB0aGUgZmlsZXMgaW5zaWRlCnRoZSBwYWNrYWdlcyAoZm9yIGluc3RhbmNlLCB0aGUgZXhl
Y3V0YWJsZXMpLCB0ZW5kIHRvIGJlIHVuc2lnbmVkLiBUaGlzCm1ha2VzIGl0IGRpZmZpY3VsdCB0
byB1dGlsaXplIElQRSBpbiBzeXN0ZW1zIHdoZXJlIGEgcGFja2FnZSBtYW5hZ2VyIGlzCmV4cGVj
dGVkIHRvIGJlIGZ1bmN0aW9uYWwsIHdpdGhvdXQgbWFqb3IgY2hhbmdlcyB0byB0aGUgcGFja2Fn
ZSBtYW5hZ2VyCmFuZCBlY29zeXN0ZW0gYmVoaW5kIGl0LgoKUG9saWN5OgotLS0tLS0tCgpJUEUg
cG9saWN5IGlzIGEgcGxhaW4tdGV4dCBbI11fIHBvbGljeSBjb21wb3NlZCBvZiBtdWx0aXBsZSBz
dGF0ZW1lbnRzCm92ZXIgc2V2ZXJhbCBsaW5lcy4gVGhlcmUgaXMgb25lIHJlcXVpcmVkIGxpbmUs
IGF0IHRoZSB0b3Agb2YgdGhlCnBvbGljeSwgaW5kaWNhdGluZyB0aGUgcG9saWN5IG5hbWUsIGFu
ZCB0aGUgcG9saWN5IHZlcnNpb24sIGZvcgppbnN0YW5jZToKCiAgcG9saWN5X25hbWU9IkV4IFBv
bGljeSIgcG9saWN5X3ZlcnNpb249MC4wLjAKClRoZSBwb2xpY3kgdmVyc2lvbiBpbmRpY2F0ZXMg
dGhlIGN1cnJlbnQgdmVyc2lvbiBvZiB0aGUgcG9saWN5IChOT1QgdGhlCnBvbGljeSBzeW50YXgg
dmVyc2lvbikuIFRoaXMgaXMgdXNlZCB0byBwcmV2ZW50IHJvbGwtYmFjayBvZiBwb2xpY3kgdG8K
cG90ZW50aWFsbHkgaW5zZWN1cmUgcHJldmlvdXMgdmVyc2lvbnMgb2YgdGhlIHBvbGljeS4KClRo
ZSBuZXh0IHBvcnRpb24gb2YgSVBFIHBvbGljeSwgYXJlIHJ1bGVzLiBSdWxlcyBhcmUgZm9ybWVk
IGJ5IGtleT12YWx1ZQpwYWlycywga25vd24gYXMgcHJvcGVydGllcy4gSVBFIHJ1bGVzIHJlcXVp
cmUgdHdvIHByb3BlcnRpZXM6ICJhY3Rpb24iLAp3aGljaCBkZXRlcm1pbmVzIHdoYXQgSVBFIGRv
ZXMgd2hlbiBpdCBlbmNvdW50ZXJzIGEgbWF0Y2ggYWdhaW5zdCB0aGUKcG9saWN5LCBhbmQgIm9w
Iiwgd2hpY2ggZGV0ZXJtaW5lcyB3aGVuIHRoYXQgcnVsZSBzaG91bGQgYmUgZXZhbHVhdGVkLgpU
aHVzLCBhIG1pbmltYWwgcnVsZSBpczoKCiAgb3A9RVhFQ1VURSBhY3Rpb249QUxMT1cKClRoaXMg
ZXhhbXBsZSB3aWxsIGFsbG93IGFueSBleGVjdXRpb24uIEFkZGl0aW9uYWwgcHJvcGVydGllcyBh
cmUgdXNlZCB0bwpyZXN0cmljdCBhdHRyaWJ1dGVzIGFib3V0IHRoZSBmaWxlcyBiZWluZyBldmFs
dWF0ZWQuIFRoZXNlIHByb3BlcnRpZXMgYXJlCmludGVuZGVkIHRvIGJlIGRldGVybWluaXN0aWMg
YXR0cmlidXRlcyB0aGF0IGFyZSByZXNpZGVudCBpbiB0aGUga2VybmVsLgpBdmFpbGFibGUgcHJv
cGVydGllcyBmb3IgSVBFIGRlc2NyaWJlZCBpbiB0aGUgZG9jdW1lbnRhdGlvbiBwYXRjaCBvZiB0
aGlzCnNlcmllcy4KCkEgcnVsZSBpcyByZXF1aXJlZCB0byBoYXZlIHRoZSAib3AiIHByb3BlcnR5
IGFzIHRoZSBmaXJzdCB0b2tlbiBvZiBhIHJ1bGUsCmFuZCB0aGUgImFjdGlvbiIgYXMgdGhlIGxh
c3QgdG9rZW4gb2YgdGhlIHJ1bGUuIFJ1bGVzIGFyZSBldmFsdWF0ZWQKdG9wLXRvLWJvdHRvbS4g
QXMgYSByZXN1bHQsIGFueSByZXZvY2F0aW9uIHJ1bGVzLCBvciBkZW5pZXMgc2hvdWxkIGJlCnBs
YWNlZCBlYXJseSBpbiB0aGUgZmlsZSB0byBlbnN1cmUgdGhhdCB0aGVzZSBydWxlcyBhcmUgZXZh
bHVhdGVkIGJlZm9yZQphIHJ1bGUgd2l0aCAiYWN0aW9uPUFMTE9XIiBpcyBoaXQuCgpBbnkgdW5r
bm93biBzeW50YXggaW4gSVBFIHBvbGljeSB3aWxsIHJlc3VsdCBpbiBhIGZhdGFsIGVycm9yIHRv
IHBhcnNlCnRoZSBwb2xpY3kuIFVzZXIgbW9kZSBjYW4gaW50ZXJyb2dhdGUgdGhlIGtlcm5lbCB0
byB1bmRlcnN0YW5kIHdoYXQKcHJvcGVydGllcyBhbmQgdGhlIGFzc29jaWF0ZWQgdmVyc2lvbnMg
dGhyb3VnaCB0aGUgc2VjdXJpdHlmcyBub2RlLAokc2VjdXJpdHlmcy9pcGUvY29uZmlnLCB3aGlj
aCB3aWxsIHJldHVybiBhIHN0cmluZyBvZiBmb3JtOgoKICBrZXkxPXZlcnNpb24xCiAga2V5Mj12
ZXJzaW9uMgogIC4KICAuCiAgLgogIGtleU49dmVyc2lvbk4KClVzZXItbW9kZSBzaG91bGQgY29y
cmVsYXRlIHRoZXNlIHZlcnNpb25zIHdpdGggdGhlIHN1cHBvcnRlZCB2YWx1ZXMKaWRlbnRpZmll
ZCBpbiB0aGUgZG9jdW1lbnRhdGlvbiB0byBkZXRlcm1pbmUgd2hldGhlciBhIHBvbGljeSBzaG91
bGQKYmUgYWNjZXB0ZWQgYnkgdGhlIHN5c3RlbSB3aXRob3V0IGFjdHVhbGx5IHRyeWluZyB0byBk
ZXBsb3kgdGhlIHBvbGljeS4KCkFkZGl0aW9uYWxseSwgYSBERUZBVUxUIG9wZXJhdGlvbiBtdXN0
IGJlIHNldCBmb3IgYWxsIHVuZGVyc3Rvb2QKb3BlcmF0aW9ucyB3aXRoaW4gSVBFLiBGb3IgcG9s
aWNpZXMgdG8gcmVtYWluIGNvbXBsZXRlbHkgZm9yd2FyZHMKY29tcGF0aWJsZSwgaXQgaXMgcmVj
b21tZW5kZWQgdGhhdCB1c2VycyBhZGQgYSAiREVGQVVMVCBhY3Rpb249QUxMT1ciCmFuZCBvdmVy
cmlkZSB0aGUgZGVmYXVsdHMgb24gYSBwZXItb3BlcmF0aW9uIGJhc2lzLgoKRm9yIG1vcmUgaW5m
b3JtYXRpb24gYWJvdXQgdGhlIHBvbGljeSBzeW50YXgsIHRoZSBrZXJuZWwgZG9jdW1lbnRhdGlv
bgpwYWdlLgoKRWFybHkgVXNlcm1vZGUgUHJvdGVjdGlvbjoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KCklQRSBjYW4gYmUgcHJvdmlkZWQgd2l0aCBhIHBvbGljeSBhdCBzdGFydHVwIHRvIGxv
YWQgYW5kIGVuZm9yY2UuClRoaXMgaXMgaW50ZW5kZWQgdG8gYmUgYSBtaW5pbWFsIHBvbGljeSB0
byBnZXQgdGhlIHN5c3RlbSB0byBhIHN0YXRlCndoZXJlIHVzZXJsYW5kIGlzIHNldHVwIGFuZCBy
ZWFkeSB0byByZWNlaXZlIGNvbW1hbmRzLCBhdCB3aGljaApwb2ludCBhIHBvbGljeSBjYW4gYmUg
ZGVwbG95ZWQgdmlhIHNlY3VyaXR5ZnMuIFRoaXMgImJvb3QgcG9saWN5IiBjYW4gYmUKc3BlY2lm
aWVkIHZpYSB0aGUgY29uZmlnLCBTRUNVUklUWV9JUEVfQk9PVF9QT0xJQ1ksIHdoaWNoIGFjY2Vw
dHMgYSBwYXRoCnRvIGEgcGxhaW4tdGV4dCB2ZXJzaW9uIG9mIHRoZSBJUEUgcG9saWN5IHRvIGFw
cGx5LiBUaGlzIHBvbGljeSB3aWxsIGJlCmNvbXBpbGVkIGludG8gdGhlIGtlcm5lbC4gSWYgbm90
IHNwZWNpZmllZCwgSVBFIHdpbGwgYmUgZGlzYWJsZWQgdW50aWwgYQpwb2xpY3kgaXMgZGVwbG95
ZWQgYW5kIGFjdGl2YXRlZCB0aHJvdWdoIHRoZSBtZXRob2QgYWJvdmUuCgpQb2xpY3kgRXhhbXBs
ZXM6Ci0tLS0tLS0tLS0tLS0tLS0KCkFsbG93IGFsbDoKCiAgcG9saWN5X25hbWU9IkFsbG93IEFs
bCIgcG9saWN5X3ZlcnNpb249MC4wLjAKICBERUZBVUxUIGFjdGlvbj1BTExPVwoKQWxsb3cgb25s
eSBpbml0aWFsIHN1cGVyYmxvY2s6CgogIHBvbGljeV9uYW1lPSJBbGxvdyBBbGwgSW5pdGlhbCBT
QiIgcG9saWN5X3ZlcnNpb249MC4wLjAKICBERUZBVUxUIGFjdGlvbj1ERU5ZCgogIG9wPUVYRUNV
VEUgYm9vdF92ZXJpZmllZD1UUlVFIGFjdGlvbj1BTExPVwoKQWxsb3cgYW55IHNpZ25lZCBkbS12
ZXJpdHkgdm9sdW1lIGFuZCB0aGUgaW5pdGlhbCBzdXBlcmJsb2NrOgoKICBwb2xpY3lfbmFtZT0i
QWxsb3dTaWduZWRBbmRJbml0aWFsIiBwb2xpY3lfdmVyc2lvbj0wLjAuMAogIERFRkFVTFQgYWN0
aW9uPURFTlkKCiAgb3A9RVhFQ1VURSBib290X3ZlcmlmaWVkPVRSVUUgYWN0aW9uPUFMTE9XCiAg
b3A9RVhFQ1VURSBkbXZlcml0eV9zaWduYXR1cmU9VFJVRSBhY3Rpb249QUxMT1cKClByb2hpYml0
IGV4ZWN1dGlvbiBmcm9tIGEgc3BlY2lmaWMgZG0tdmVyaXR5IHZvbHVtZToKCiAgcG9saWN5X25h
bWU9IkFsbG93U2lnbmVkQW5kSW5pdGlhbCIgcG9saWN5X3ZlcnNpb249MC4wLjAKICBERUZBVUxU
IGFjdGlvbj1ERU5ZCgogIG9wPUVYRUNVVEUgZG12ZXJpdHlfcm9vdGhhc2g9NDAxZmNlYzU5NDQ4
MjNhZTEyZjYyNzI2ZTgxODQ0MDdhNWZhOTU5OTc4M2YwMzBkZWMxNDY5MzggYWN0aW9uPURFTlkK
ICBvcD1FWEVDVVRFIGJvb3RfdmVyaWZpZWQ9VFJVRSBhY3Rpb249QUxMT1cKICBvcD1FWEVDVVRF
IGRtdmVyaXR5X3NpZ25hdHVyZT1UUlVFIGFjdGlvbj1BTExPVwoKQWxsb3cgb25seSBhIHNwZWNp
ZmljIGRtLXZlcml0eSB2b2x1bWU6CgogIHBvbGljeV9uYW1lPSJBbGxvd1NpZ25lZEFuZEluaXRp
YWwiIHBvbGljeV92ZXJzaW9uPTAuMC4wCiAgREVGQVVMVCBhY3Rpb249REVOWQoKICBvcD1FWEVD
VVRFIGRtdmVyaXR5X3Jvb3RoYXNoPTQwMWZjZWM1OTQ0ODIzYWUxMmY2MjcyNmU4MTg0NDA3YTVm
YTk1OTk3ODNmMDMwZGVjMTQ2OTM4IGFjdGlvbj1BTExPVwoKRGVwbG95aW5nIFBvbGljaWVzOgot
LS0tLS0tLS0tLS0tLS0tLS0tCgpGaXJzdCBzaWduIGEgcGxhaW4gdGV4dCBwb2xpY3ksIHdpdGgg
YSBjZXJ0aWZpY2F0ZSB0aGF0IGlzIHByZXNlbnQgaW4KdGhlIFNZU1RFTV9UUlVTVEVEX0tFWVJJ
Tkcgb2YgeW91ciB0ZXN0IG1hY2hpbmUuIFRocm91Z2ggb3BlbnNzbCwgdGhlCnNpZ25pbmcgY2Fu
IGJlIGRvbmUgdmlhOgoKICBvcGVuc3NsIHNtaW1lIC1zaWduIC1pbiAiJE1ZX1BPTElDWSIgLXNp
Z25lciAiJE1ZX0NFUlRJRklDQVRFIiBcCiAgICAtaW5rZXkgIiRNWV9QUklWQVRFX0tFWSIgLWJp
bmFyeSAtb3V0Zm9ybSBkZXIgLW5vYXR0ciAtbm9kZXRhY2ggXAogICAgLW91dCAiJE1ZX1BPTElD
WS5wN3MiCgpUaGVuLCBzaW1wbHkgY2F0IHRoZSBmaWxlIGludG8gdGhlIElQRSdzICJuZXdfcG9s
aWN5IiBzZWN1cml0eWZzIG5vZGU6CgogIGNhdCAiJE1ZX1BPTElDWS5wN3MiID4gL3N5cy9rZXJu
ZWwvc2VjdXJpdHkvaXBlL25ld19wb2xpY3kKClRoZSBwb2xpY3kgc2hvdWxkIG5vdyBiZSBwcmVz
ZW50IHVuZGVyIHRoZSBwb2xpY2llcy8gc3ViZGlyZWN0b3J5LCB1bmRlcgppdHMgInBvbGljeV9u
YW1lIiBhdHRyaWJ1dGUuCgpUaGUgcG9saWN5IGlzIG5vdyBwcmVzZW50IGluIHRoZSBrZXJuZWwg
YW5kIGNhbiBiZSBtYXJrZWQgYXMgYWN0aXZlLAp2aWEgdGhlIHNlY3VyaXR5ZnMgbm9kZToKCiAg
ZWNobyAiMSIgPiAiL3N5cy9rZXJuZWwvc2VjdXJpdHkvaXBlLyRNWV9QT0xJQ1lfTkFNRS9hY3Rp
dmUiCgpUaGlzIHdpbGwgbm93IG1hcmsgdGhlIHBvbGljeSBhcyBhY3RpdmUgYW5kIHRoZSBzeXN0
ZW0gd2lsbCBiZSBlbmZvcmNpbmcKJE1ZX1BPTElDWV9OQU1FLgoKVGhlcmUgaXMgb25lIHJlcXVp
cmVtZW50IHdoZW4gbWFya2luZyBhIHBvbGljeSBhcyBhY3RpdmUsIHRoZSBwb2xpY3lfdmVyc2lv
bgphdHRyaWJ1dGUgbXVzdCBlaXRoZXIgaW5jcmVhc2UsIG9yIHJlbWFpbiB0aGUgc2FtZSBhcyB0
aGUgY3VycmVudGx5IHJ1bm5pbmcKcG9saWN5LgoKUG9saWNpZXMgY2FuIGJlIHVwZGF0ZWQgdmlh
OgoKICBjYXQgIiRNWV9VUERBVEVEX1BPTElDWS5wN3MiID4gXAogICAgIi9zeXMva2VybmVsL3Nl
Y3VyaXR5L2lwZS9wb2xpY2llcy8kTVlfUE9MSUNZX05BTUUvdXBkYXRlIgoKQWRkaXRpb25hbGx5
LCBwb2xpY2llcyBjYW4gYmUgZGVsZXRlZCB2aWEgdGhlICJkZWxldGUiIHNlY3VyaXR5ZnMKbm9k
ZS4gU2ltcGx5IHdyaXRlICIxIiB0byB0aGUgY29ycmVzcG9uZGluZyBub2RlIGluIHRoZSBwb2xp
Y3kgZm9sZGVyOgoKICBlY2hvICIxIiA+ICIvc3lzL2tlcm5lbC9zZWN1cml0eS9pcGUvcG9saWNp
ZXMvJE1ZX1BPTElDWV9OQU1FL2RlbGV0ZSIKClRoZXJlIGlzIG9ubHkgb25lIHJlcXVpcmVtZW50
IHRvIGRlbGV0ZSBwb2xpY2llcywgdGhlIHBvbGljeSBiZWluZwpkZWxldGVkIG11c3Qgbm90IGJl
IHRoZSBhY3RpdmUgcG9saWN5LgoKTk9URTogVGhlIHNlY3VyaXR5ZnMgY29tbWFuZHMgd2lsbCBy
ZXF1aXJlIENBUF9NQUNfQURNSU4uCgpJbnRlZ3JhdGlvbnM6Ci0tLS0tLS0tLS0tLS0KClRoaXMg
cGF0Y2ggc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgZnN2ZXJpdHkgdmlhIGRpZ2VzdCBhbmQgc2ln
bmF0dXJlCihmc3Zlcml0eV9zaWduYXR1cmUgYW5kIGZzdmVyaXR5X2RpZ2VzdCksIGRtLXZlcml0
eSBieSBkaWdlc3QgYW5kCnNpZ25hdHVyZSAoZG12ZXJpdHlfc2lnbmF0dXJlIGFuZCBkbXZlcml0
eV9yb290aGFzaCksIGFuZCB0cnVzdCBmb3IKdGhlIGluaXRyYW1mcyAoYm9vdF92ZXJpZmllZCku
CgpQbGVhc2Ugc2VlIHRoZSBkb2N1bWVudGF0aW9uIHBhdGNoIGZvciBtb3JlIGluZm9ybWF0aW9u
IGFib3V0IHRoZQppbnRlZ3JhdGlvbnMgYXZhaWxhYmxlLgoKVGVzdGluZzoKLS0tLS0tLS0KCktV
bml0IFRlc3RzIGFyZSBhdmFpbGFibGUuIFJlY29tbWVuZGVkIGt1bml0Y29uZmlnOgoKICAgIENP
TkZJR19LVU5JVD15CiAgICBDT05GSUdfU0VDVVJJVFk9eQogICAgQ09ORklHX1NFQ1VSSVRZRlM9
eQogICAgQ09ORklHX1BLQ1M3X01FU1NBR0VfUEFSU0VSPXkKICAgIENPTkZJR19TWVNURU1fREFU
QV9WRVJJRklDQVRJT049eQogICAgQ09ORklHX0ZTX1ZFUklUWT15CiAgICBDT05GSUdfRlNfVkVS
SVRZX0JVSUxUSU5fU0lHTkFUVVJFUz15CiAgICBDT05GSUdfQkxPQ0s9eQogICAgQ09ORklHX01E
PXkKICAgIENPTkZJR19CTEtfREVWX0RNPXkKICAgIENPTkZJR19ETV9WRVJJVFk9eQogICAgQ09O
RklHX0RNX1ZFUklUWV9WRVJJRllfUk9PVEhBU0hfU0lHPXkKCiAgICBDT05GSUdfU0VDVVJJVFlf
SVBFPXkKICAgIENPTkZJR19TRUNVUklUWV9JUEVfS1VOSVRfVEVTVD15CiAgICBDT05GSUdfSVBF
X1BST1BfQk9PVF9WRVJJRklFRD15CiAgICBDT05GSUdfSVBFX1BST1BfRE1fVkVSSVRZX1NJR05B
VFVSRT15CiAgICBDT05GSUdfSVBFX1BST1BfRE1fVkVSSVRZX1JPT1RIQVNIPXkKICAgIENPTkZJ
R19JUEVfUFJPUF9GU19WRVJJVFlfU0lHTkFUVVJFPXkKICAgIENPTkZJR19JUEVfUFJPUF9GU19W
RVJJVFlfRElHRVNUPXkKClNpbXBseSBydW46CgogICAgbWFrZSBBUkNIPXVtIG1ycHJvcGVyIAog
ICAgLi90b29scy90ZXN0aW5nL2t1bml0L2t1bml0LnB5IHJ1biAtLWt1bml0Y29uZmlnIDxwYXRo
L3RvL2NvbmZpZz4KCkFuZCB0aGUgdGVzdHMgd2lsbCBleGVjdXRlIGFuZCByZXBvcnQgdGhlIHJl
c3VsdC4gRm9yIG1vcmUgaW5kZXB0aCB0ZXN0aW5nLAppdCB3aWxsIHJlcXVpcmUgeW91IHRvIGNy
ZWF0ZSBhbmQgbW91bnQgYSBkbS12ZXJpdHkgdm9sdW1lIG9yIGZzLXZlcml0eQplbmFibGVkIGZp
bGUuCgpEb2N1bWVudGF0aW9uOgotLS0tLS0tLS0tLS0tLQoKVGhlcmUgaXMgYm90aCBkb2N1bWVu
dGF0aW9uIGF2YWlsYWJsZSBvbiBnaXRodWIgYXQKaHR0cHM6Ly9taWNyb3NvZnQuZ2l0aHViLmlv
L2lwZSwgYW5kIERvY3VtZW50YXRpb24gaW4gdGhpcyBwYXRjaCBzZXJpZXMsCnRvIGJlIGFkZGVk
IGluLXRyZWUuIFRoaXMgaW5jbHVkZXMgYXJjaGl0ZWN0dXJhbCBibG9jayBkaWFncmFtcy4KCktu
b3duIEdhcHM6Ci0tLS0tLS0tLS0tCgpJUEUgaGFzIHR3byBrbm93biBnYXBzOgoKMS4gSVBFIGNh
bm5vdCB2ZXJpZnkgdGhlIGludGVncml0eSBvZiBhbm9ueW1vdXMgZXhlY3V0YWJsZSBtZW1vcnks
IHN1Y2ggYXMKICB0aGUgdHJhbXBvbGluZXMgY3JlYXRlZCBieSBnY2MgY2xvc3VyZXMgYW5kIGxp
YmZmaSAoPDMuNC4yKSwgb3IgSklUJ2QgY29kZS4KICBVbmZvcnR1bmF0ZWx5LCBhcyB0aGlzIGlz
IGR5bmFtaWNhbGx5IGdlbmVyYXRlZCBjb2RlLCB0aGVyZSBpcyBubyB3YXkKICBmb3IgSVBFIHRv
IGVuc3VyZSB0aGUgaW50ZWdyaXR5IG9mIHRoaXMgY29kZSB0byBmb3JtIGEgdHJ1c3QgYmFzaXMu
IEluIGFsbAogIGNhc2VzLCB0aGUgcmV0dXJuIHJlc3VsdCBmb3IgdGhlc2Ugb3BlcmF0aW9ucyB3
aWxsIGJlIHdoYXRldmVyIHRoZSBhZG1pbgogIGNvbmZpZ3VyZXMgdGhlIERFRkFVTFQgYWN0aW9u
IGZvciAiRVhFQ1VURSIuCgoyLiBJUEUgY2Fubm90IHZlcmlmeSB0aGUgaW50ZWdyaXR5IG9mIGlu
dGVycHJldGVkIGxhbmd1YWdlcycgcHJvZ3JhbXMgd2hlbgogIHRoZXNlIHNjcmlwdHMgaW52b2tl
ZCB2aWEgYGA8aW50ZXJwcmV0ZXI+IDxmaWxlPmBgLiBUaGlzIGlzIGJlY2F1c2UgdGhlCiAgd2F5
IGludGVycHJldGVycyBleGVjdXRlIHRoZXNlIGZpbGVzLCB0aGUgc2NyaXB0cyB0aGVtc2VsdmVz
IGFyZSBub3QKICBldmFsdWF0ZWQgYXMgZXhlY3V0YWJsZSBjb2RlIHRocm91Z2ggb25lIG9mIElQ
RSdzIGhvb2tzLiBJbnRlcnByZXRlcnMKICBjYW4gYmUgZW5saWdodGVuZWQgdG8gdGhlIHVzYWdl
IG9mIElQRSBieSB0cnlpbmcgdG8gbW1hcCBhIGZpbGUgaW50bwogIGV4ZWN1dGFibGUgbWVtb3J5
ICgrWCksIGFmdGVyIG9wZW5pbmcgdGhlIGZpbGUgYW5kIHJlc3BvbmRpbmcgdG8gdGhlCiAgZXJy
b3IgY29kZSBhcHByb3ByaWF0ZWx5LiBUaGlzIGFsc28gYXBwbGllcyB0byBpbmNsdWRlZCBmaWxl
cywgb3IgaGlnaAogIHZhbHVlIGZpbGVzLCBzdWNoIGFzIGNvbmZpZ3VyYXRpb24gZmlsZXMgb2Yg
Y3JpdGljYWwgc3lzdGVtIGNvbXBvbmVudHMuCiAgSG93ZXZlciwgdGhlcmUgaXMgYSBwYXRjaHNl
dCB0aGF0IGlzIGxvb2tpbmcgdG8gYWRkcmVzcyB0aGlzIGdhcCBbMV0uCgpBcHBlbmRpeDoKLS0t
LS0tLS0tCgpBLiBJUEUgR2l0aHViIFJlcG9zaXRvcnk6IGh0dHBzOi8vZ2l0aHViLmNvbS9taWNy
b3NvZnQvaXBlCkIuIElQRSBVc2VycycgR3VpZGU6IERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUv
TFNNL2lwZS5yc3QKClJlZmVyZW5jZXM6Ci0tLS0tLS0tLS0tCgpbMV0gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjExMDEyMTkyNDEwLjIzNTYwOTAtMS1taWNAZGlnaWtvZC5uZXQvCgpG
QVE6Ci0tLS0KClE6IFdoYXQncyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIG90aGVyIExTTXMgd2hp
Y2ggcHJvdmlkZSB0cnVzdC1iYXNlZAogIGFjY2VzcyBjb250cm9sLCBmb3IgaW5zdGFuY2UsIElN
QT8KCkE6IElNQSBpcyBhIGZhbnRhc3RpYyBvcHRpb24gd2hlbiBuZWVkaW5nIG1lYXN1cmVtZW50
IGluIGFkZGl0aW9uIHRvIHRoZQogIHRydXN0LWJhc2VkIGFjY2VzcyBtb2RlbC4gQWxsIG9mIElN
QSBpcyBjZW50ZXJlZCBhcm91bmQgdGhlaXIgbWVhc3VyZW1lbnQKICBoYXNoZXMsIHNvIHlvdSBz
YXZlIHRpbWUgd2hlbiBkb2luZyBib3RoIGFjdGlvbnMuIElQRSwgb24gdGhlIG90aGVyIGhhbmQs
CiAgaXMgYSBoaWdobHkgcGVyZm9ybWFudCBzeXN0ZW0gdGhhdCBkb2VzIG5vdCByZWx5IChhbmQg
ZXhwbGljaXRseSBwcm9oaWJpdHMpLAogIGdlbmVyYXRpbmcgaXRzIG93biBpbnRlZ3JpdHkgbWVj
aGFuaXNtcyAtIHNlcGFyYXRpbmcgbWVhc3VyZW1lbnQgYW5kIGFjY2VzcwogIGNvbnRyb2wuIFNp
bXBseSBwdXQsIElQRSBwcm92aWRlcyBvbmx5IHRoZSBlbmZvcmNlbWVudCBvZiB0cnVzdCwgd2hp
bGUgb3RoZXIKICBzdWJzeXN0ZW1zIHByb3ZpZGUgdGhlIGludGVncml0eSBndWFyYW50ZWUgdGhh
dCBJUEUgbmVlZHMgdG8gZGV0ZXJtaW5lIHRoZQogIHRydXN0IG9mIGEgcmVzb3VyY2UuIElNQSBw
cm92aWRlcyBib3RoIHRoZSBpbnRlZ3JpdHkgZ3VhcmFudGVlLCB0aGUKICBlbmZvcmNlbWVudCBv
ZiB0cnVzdCwgYW5kIGEgd2hvbGUgaG9zdCBvZiBvdGhlciBmZWF0dXJlcyB0aGF0IG1heSBub3Qg
YmUKICBuZWVkZWQuCgpDaGFuZ2Vsb2c6Ci0tLS0tLS0tLS0KCkNoYW5nZXMgc2luY2UgdjE6CiAg
U3BsaXQgdGhlIHNlY29uZCBwYXRjaCBvZiB0aGUgcHJldmlvdXMgc2VyaWVzIGludG8gdHdvLgog
IE1pbm9yIGNvcnJlY3Rpb25zIGluIHRoZSBjb3Zlci1sZXR0ZXIgYW5kIGRvY3VtZW50YXRpb24K
ICBjb21tZW50cyByZWdhcmRpbmcgQ0FQX01BQ19BRE1JTiBjaGVja3MgaW4gSVBFLgoKQ2hhbmdl
cyBzaW5jZSB2MjoKICBBZGRyZXNzIHZhcmlvdXMgY29tbWVudHMgYnkgSmFubiBIb3JuLiBIaWdo
bGlnaHRzOgogICAgU3dpdGNoIHZhcmlvdXMgYXVkaXQgYWxsb2NhdG9ycyB0byBHRlBfS0VSTkVM
LgogICAgVXRpbGl6ZSByY3VfYWNjZXNzX3BvaW50ZXIoKSBpbiB2YXJpb3VzIGxvY2F0aW9ucy4K
ICAgIFN0cmlwIG91dCB0aGUgY2FjaGluZyBzeXN0ZW0gZm9yIHByb3BlcnRpZXMKICAgIFN0cmlw
IGNvbW1lbnRzIGZyb20gaGVhZGVycwogICAgTW92ZSBmdW5jdGlvbnMgYXJvdW5kIGluIHBhdGNo
ZXMKICAgIFJlbW92ZSBrZXJuZWwgY29tbWFuZCBsaW5lIHBhcmFtZXRlcnMKICAgIFJlY29uY2ls
ZSB0aGUgcmFjZSBjb25kaXRpb24gb24gdGhlIGRlbGV0ZSBub2RlIGZvciBwb2xpY3kgYnkKICAg
ICAgZXhwYW5kaW5nIHRoZSBwb2xpY3kgY3JpdGljYWwgc2VjdGlvbi4KCiAgQWRkcmVzcyBhIGZl
dyBjb21tZW50cyBieSBKb25hdGhhbiBDb3JiZXQgYXJvdW5kIHRoZSBkb2N1bWVudGF0aW9uCiAg
ICBwYWdlcyBmb3IgSVBFLgoKICBGaXggYW4gaXNzdWUgd2l0aCB0aGUgaW5pdGlhbGl6YXRpb24g
b2YgSVBFIHBvbGljeSB3aXRoIGEgIi0wIgogICAgdmVyc2lvbiwgY2F1c2VkIGJ5IG5vdCBpbml0
aWFsaXppbmcgdGhlIGhsaXN0IGVudHJpZXMgYmVmb3JlCiAgICBmcmVlaW5nLgoKQ2hhbmdlcyBz
aW5jZSB2MzoKICBBZGRyZXNzIGEgY29uY2VybiBhcm91bmQgSVBFJ3MgYmVoYXZpb3Igd2l0aCB1
bmtub3duIHN5bnRheC4KICAgIFNwZWNpZmljYWxseSwgbWFrZSBhbnkgdW5rbm93biBzeW50YXgg
YSBmYXRhbCBlcnJvciBpbnN0ZWFkIG9mIGEKICAgIHdhcm5pbmcsIGFzIHN1Z2dlc3RlZCBieSBN
aWNrYcOrbCBTYWxhw7xuLgogIEludHJvZHVjZSBhIG5ldyBzZWN1cml0eWZzIG5vZGUsICRzZWN1
cml0eWZzL2lwZS9wcm9wZXJ0eV9jb25maWcsCiAgICB3aGljaCBwcm92aWRlcyBhIGxpc3Rpbmcg
b2Ygd2hhdCBwcm9wZXJ0aWVzIGFyZSBlbmFibGVkIGJ5IHRoZQogICAga2VybmVsIGFuZCB0aGVp
ciB2ZXJzaW9ucy4gVGhpcyBhbGxvd3MgdXNlcm1vZGUgdG8gcHJlZGljdCB3aGF0CiAgICBwb2xp
Y2llcyBzaG91bGQgYmUgYWxsb3dlZC4KICBTdHJpcCBzb21lIGNvbW1lbnRzIGZyb20gYyBmaWxl
cyB0aGF0IEkgbWlzc2VkLgogIENsYXJpZnkgc29tZSBkb2N1bWVudGF0aW9uIGNvbW1lbnRzIGFy
b3VuZCAnYm9vdF92ZXJpZmllZCcuCiAgICBXaGlsZSB0aGlzIGN1cnJlbnRseSBkb2VzIG5vdCBm
dW5jdGlvbmFsbHkgY2hhbmdlIHRoZSBwcm9wZXJ0eQogICAgaXRzZWxmLCB0aGUgZGlzdGluY3Rp
b24gaXMgaW1wb3J0YW50IHdoZW4gSVBFIGNhbiBlbmZvcmNlIHZlcmlmaWVkCiAgICByZWFkcy4g
QWRkaXRpb25hbGx5LCAnS0VSTkVMX1JFQUQnIHdhcyBvbWl0dGVkIGZyb20gdGhlIGRvY3VtZW50
YXRpb24uCiAgICBUaGlzIGhhcyBiZWVuIGNvcnJlY3RlZC4KICBDaGFuZ2UgU2VjdXJpdHlGUyBh
bmQgU0hBMSB0byBhIHJldmVyc2UgZGVwZW5kZW5jeS4KICBVcGRhdGUgdGhlIGNvdmVyLWxldHRl
ciB3aXRoIHRoZSB1cGRhdGVkIGJlaGF2aW9yIG9mIHVua25vd24gc3ludGF4LgogIFJlbW92ZSBh
bGwgc3lzY3RscywgbWFraW5nIGFuIGVxdWl2YWxlbnQgZnVuY3Rpb24gaW4gc2VjdXJpdHlmcy4K
ICBSZXdvcmsgdGhlIGFjdGl2ZS9kZWxldGUgbWVjaGFuaXNtIHRvIGJlIGEgbm9kZSB1bmRlciB0
aGUgcG9saWN5IGluCiAgICAkc2VjdXJpdHlmcy9pcGUvcG9saWNpZXMuCiAgVGhlIGtlcm5lbCBj
b21tYW5kIGxpbmUgcGFyYW1ldGVycyBpcGUuZW5mb3JjZSBhbmQgaXBlLnN1Y2Nlc3NfYXVkaXQK
ICAgIGhhdmUgcmV0dXJuZWQgYXMgdGhpcyBmdW5jdGlvbmFsaXR5IGlzIG5vIGxvbmdlciBleHBv
c2VkIHRocm91Z2gKICAgIHN5c2ZzLgoKQ2hhbmdlcyBzaW5jZSB2NDoKICBDb3JyZWN0IHNvbWUg
Z3JhbW1hdGljYWwgZXJyb3JzIHJlcG9ydGVkIGJ5IFJhbmR5IER1bmxhcC4KICBGaXggc29tZSB3
YXJuaW5ncyByZXBvcnRlZCBieSBrZXJuZWwgdGVzdCBib3QuCiAgQ2hhbmdlIGNvbnZlbnRpb24g
YXJvdW5kIHNlY3VyaXR5X2JkZXZfc2V0c2VjdXJpdHkuIC1FTk9TWVMKICAgIGlzIG5vdyBleHBl
Y3RlZCBpZiBhbiBMU00gZG9lcyBub3QgaW1wbGVtZW50IGEgcGFydGljdWxhciBAbmFtZSwKICAg
IGFzIHN1Z2dlc3RlZCBieSBDYXNleSBTY2hhdWZsZXIuCiAgTWlub3Igc3RyaW5nIGNvcnJlY3Rp
b25zIHJlbGF0ZWQgdG8gdGhlIG1vdmUgZnJvbSBzeXNmcyB0byBzZWN1cml0eWZzCiAgQ29ycmVj
dCBhIHNwZWxsaW5nIG9mIGFuICNpZmRlZiBmb3IgdGhlIHBlcm1pc3NpdmUgYXJndW1lbnQuCiAg
QWRkIHRoZSBrZXJuZWwgcGFyYW1ldGVycyByZS1hZGRlZCB0byB0aGUgZG9jdW1lbnRhdGlvbi4K
ICBGaXggYSBtaW5vciBidWcgd2hlcmUgdGhlIG1vZGUgYmVpbmcgYXVkaXRlZCBvbiBwZXJtaXNz
aXZlIHN3aXRjaAogICAgd2FzIHRoZSBvcmlnaW5hbCBtb2RlLCBub3QgdGhlIG1vZGUgYmVpbmcg
c3dhcHBlZCB0by4KICBDbGVhbnVwIGRvYyBjb21tZW50cywgZml4IHNvbWUgd2hpdGVzcGFjZSBh
bGlnbm1lbnQgaXNzdWVzLgoKQ2hhbmdlcyBzaW5jZSB2NToKICBDaGFuZ2UgaWYgc3RhdGVtZW50
IGNvbmRpdGlvbiBpbiBzZWN1cml0eV9iZGV2X3NldHNlY3VyaXR5IHRvIGJlCiAgICBtb3JlIGNv
bmNpc2UsIGFzIHN1Z2dlc3RlZCBieSBDYXNleSBTY2hhdWZsZXIgYW5kIEFsIFZpcm8KICBEcm9w
IHRoZSA2dGggcGF0Y2ggaW4gdGhlIHNlcmllcywgImRtLXZlcml0eSBtb3ZlIHNpZ25hdHVyZSBj
aGVjay4uLiIKICAgIGR1ZSB0byBudW1lcm91cyBpc3N1ZXMsIGFuZCBpdCB1bHRpbWF0ZWx5IHBy
b3ZpZGluZyBubyByZWFsIHZhbHVlLgogIEZpeCB0aGUgcGF0Y2ggdHJlZSAtIHRoZSBwcmV2aW91
cyBpdGVyYXRpb24gYXBwZWFycyB0byBoYXZlIGJlZW4gaW4gYQogICAgdG9ybiBzdGF0ZSAocGF0
Y2hlcyA4Kzkgd2VyZSBtZXJnZWQpLiBUaGlzIGhhcyBzaW5jZSBiZWVuIGNvcnJlY3RlZC4KCkNo
YW5nZXMgc2luY2UgdjY6CiAgKiBSZXdvcmQgY292ZXIgbGV0dGVyIHRvIG1vcmUgYWNjdXJhdGUg
Y29udmV5IElQRSdzIHB1cnBvc2UKICAgIGFuZCBsYXRlc3QgdXBkYXRlcy4KICAqIFJlZmFjdG9y
IHNlcmllcyB0bzoKICAgICAgMS4gU3VwcG9ydCBhIGNvbnRleHQgc3RydWN0dXJlLCBlbmFibGlu
ZzoKICAgICAgICAgIDEuIEVhc2llciBUZXN0aW5nIHZpYSBLVU5JVAogICAgICAgICAgMi4gQSBi
ZXR0ZXIgYXJjaGl0ZWN0dXJlIGZvciBmdXR1cmUgZGVzaWducwogICAgICAyLiBNYWtlIHBhcnNl
ciBjb2RlIGNsZWFuZXIKICAqIE1vdmUgcGF0Y2ggMDEvMTIgdG8gWzE0LzE2XSBvZiB0aGUgc2Vy
aWVzCiAgKiBTcGxpdCB1cCBwYXRjaCAwMi8xMiBpbnRvIGZvdXIgcGFydHM6CiAgICAgIDEuIGNv
bnRleHQgY3JlYXRpb24gWzAxLzE2XQogICAgICAyLiBhdWRpdCBbMDcvMTZdCiAgICAgIDMuIGV2
YWx1YXRpb24gbG9vcCBbMDMvMTZdCiAgICAgIDQuIGFjY2VzcyBjb250cm9sIGhvb2tzIFswNS8x
Nl0KICAgICAgNS4gcGVybWlzc2l2ZSBtb2RlIFswOC8xNl0KICAqIFNwbGl0IHVwIHBhdGNoIDAz
LzEyIGludG8gdHdvIHBhcnRzOgogICAgICAxLiBwYXJzZXIgWzAyLzE2XQogICAgICAyLiB1c2Vy
c3BhY2UgaW50ZXJmYWNlIFswNC8xNl0KICAqIFJld29yZCBhbmQgcmVmYWN0b3IgcGF0Y2ggMDQv
MTIgdG8gWzA5LzE2XQogICogU3F1YXNoIHBhdGNoIDA1LzEyLCAwNy8xMiwgMDkvMTIgdG8gWzEw
LzE2XQogICogU3F1YXNoIHBhdGNoIDA4LzEyLCAxMC8xMiB0byBbMTEvMTZdCiAgKiBDaGFuZ2Ug
YXVkaXQgcmVjb3JkcyB0byBNQUMgcmVnaW9uICgxNFhYKSBmcm9tIEludGVncml0eSByZWdpb24g
KDE4WFgpCiAgKiBBZGQgRlNWZXJpdHkgU3VwcG9ydAogICogSW50ZXJmYWNlIGNoYW5nZXM6CiAg
ICAgIDEuICJyYXciIHdhcyByZW5hbWVkIHRvICJwa2NzNyIgYW5kIG1hZGUgcmVhZCBvbmx5CiAg
ICAgIDIuICJyYXciJ3Mgd3JpdGUgZnVuY3Rpb25hbGl0eSAodXBkYXRlIGEgcG9saWN5KSBtb3Zl
ZCB0byAidXBkYXRlIgogICAgICAzLiBpbnRyb2R1Y2VkICJ2ZXJzaW9uIiwgInBvbGljeV9uYW1l
IiBub2Rlcy4KICAgICAgNC4gImNvbnRlbnQiIHJlbmFtZWQgdG8gInBvbGljeSIKICAgICAgNS4g
VGhlIGJvb3QgcG9saWN5IGNhbiBub3cgYmUgdXBkYXRlZCBsaWtlIGFueSBvdGhlciBwb2xpY3ku
CiAgKiBBZGQgYWRkaXRpb25hbCBkZXZlbG9wZXItbGV2ZWwgZG9jdW1lbnRhdGlvbgogICogVXBk
YXRlIGFkbWluLWd1aWRlIGRvY3MgdG8gcmVmbGVjdCBjaGFuZ2VzLgogICogS3VuaXQgdGVzdHMK
ICAqIERyb3BwZWQgQ09ORklHX1NFQ1VSSVRZX0lQRV9QRVJNSVNTSVZFX1NXSVRDSCAtIGZ1bmN0
aW9uYWxpdHkgY2FuCiAgICBlYXNpbHkgY29tZSBsYXRlciB3aXRoIGEgc21hbGwgcGF0Y2guCiAg
KiBVc2UgcGFydGl0aW9uMCBmb3IgYmxvY2tfZGV2aWNlIGZvciBkbS12ZXJpdHkgcGF0Y2gKCkRl
dmVuIEJvd2VycyAoMTQpOgogIHNlY3VyaXR5OiBhZGQgaXBlIGxzbSAmIGluaXRpYWwgY29udGV4
dCBjcmVhdGlvbgogIGlwZTogYWRkIHBvbGljeSBwYXJzZXIKICBpcGU6IGFkZCBldmFsdWF0aW9u
IGxvb3AKICBpcGU6IGFkZCB1c2Vyc3BhY2UgaW50ZXJmYWNlCiAgaXBlOiBhZGQgTFNNIGhvb2tz
IG9uIGV4ZWN1dGlvbiBhbmQga2VybmVsIHJlYWQKICB1YXBpfGF1ZGl0OiBhZGQgdHJ1c3QgYXVk
aXQgbWVzc2FnZSBkZWZpbml0aW9ucwogIGlwZTogYWRkIGF1ZGl0aW5nIHN1cHBvcnQKICBpcGU6
IGFkZCBwZXJtaXNzaXZlIHRvZ2dsZQogIGlwZTogaW50cm9kdWNlICdib290X3ZlcmlmaWVkJyBh
cyBhIHRydXN0IHByb3ZpZGVyCiAgZnN8ZG0tdmVyaXR5OiBhZGQgYmxvY2tfZGV2IExTTSBibG9i
IGFuZCBzdWJtaXQgZG0tdmVyaXR5IGRhdGEKICBpcGU6IGFkZCBzdXBwb3J0IGZvciBkbS12ZXJp
dHkgYXMgYSB0cnVzdCBwcm92aWRlcgogIHNjcmlwdHM6IGFkZCBib290IHBvbGljeSBnZW5lcmF0
aW9uIHByb2dyYW0KICBpcGU6IGt1bml0IHRlc3RzCiAgZG9jdW1lbnRhdGlvbjogYWRkIGlwZSBk
b2N1bWVudGF0aW9uCgpGYW4gV3UgKDIpOgogIGZzdmVyaXR5fHNlY3VyaXR5OiBhZGQgc2VjdXJp
dHkgaG9va3MgdG8gZnN2ZXJpdHkgZGlnZXN0IGFuZCBzaWduYXR1cmUKICBpcGU6IGVuYWJsZSBz
dXBwb3J0IGZvciBmcy12ZXJpdHkgYXMgYSB0cnVzdCBwcm92aWRlcgoKIERvY3VtZW50YXRpb24v
YWRtaW4tZ3VpZGUvTFNNL2luZGV4LnJzdCAgICAgICB8ICAgIDEgKwogRG9jdW1lbnRhdGlvbi9h
ZG1pbi1ndWlkZS9MU00vaXBlLnJzdCAgICAgICAgIHwgIDU4NyArKysrKysrKysrCiAuLi4vYWRt
aW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0ICAgICAgICAgfCAgIDEyICsKIERvY3VtZW50
YXRpb24vc2VjdXJpdHkvaW5kZXgucnN0ICAgICAgICAgICAgICB8ICAgIDEgKwogRG9jdW1lbnRh
dGlvbi9zZWN1cml0eS9pcGUucnN0ICAgICAgICAgICAgICAgIHwgIDMzOSArKysrKysKIE1BSU5U
QUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDkgKwogYmxvY2sv
YmRldi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgNyArCiBkcml2ZXJz
L21kL2RtLXZlcml0eS10YXJnZXQuYyAgICAgICAgICAgICAgICAgfCAgIDIwICstCiBkcml2ZXJz
L21kL2RtLXZlcml0eS12ZXJpZnktc2lnLmMgICAgICAgICAgICAgfCAgIDE2ICstCiBkcml2ZXJz
L21kL2RtLXZlcml0eS12ZXJpZnktc2lnLmggICAgICAgICAgICAgfCAgIDEwICstCiBmcy92ZXJp
dHkvb3Blbi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEyICsKIGZzL3Zlcml0
eS9zaWduYXR1cmUuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDUgKy0KIGluY2x1ZGUv
YXNtLWdlbmVyaWMvdm1saW51eC5sZHMuaCAgICAgICAgICAgICB8ICAgMTYgKwogaW5jbHVkZS9s
aW51eC9ibGtfdHlwZXMuaCAgICAgICAgICAgICAgICAgICAgIHwgICAgMSArCiBpbmNsdWRlL2xp
bnV4L2RldmljZS1tYXBwZXIuaCAgICAgICAgICAgICAgICAgfCAgICAzICsKIGluY2x1ZGUvbGlu
dXgvZnN2ZXJpdHkuaCAgICAgICAgICAgICAgICAgICAgICB8ICAgIDMgKwogaW5jbHVkZS9saW51
eC9sc21faG9va19kZWZzLmggICAgICAgICAgICAgICAgIHwgICAgNSArCiBpbmNsdWRlL2xpbnV4
L2xzbV9ob29rcy5oICAgICAgICAgICAgICAgICAgICAgfCAgIDEyICsKIGluY2x1ZGUvbGludXgv
c2VjdXJpdHkuaCAgICAgICAgICAgICAgICAgICAgICB8ICAgMjIgKwogaW5jbHVkZS91YXBpL2xp
bnV4L2F1ZGl0LmggICAgICAgICAgICAgICAgICAgIHwgICAgNCArCiBzY3JpcHRzL01ha2VmaWxl
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxICsKIHNjcmlwdHMvaXBlL01ha2Vm
aWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDIgKwogc2NyaXB0cy9pcGUvcG9sZ2Vu
Ly5naXRpZ25vcmUgICAgICAgICAgICAgICAgIHwgICAgMSArCiBzY3JpcHRzL2lwZS9wb2xnZW4v
TWFrZWZpbGUgICAgICAgICAgICAgICAgICAgfCAgICA2ICsKIHNjcmlwdHMvaXBlL3BvbGdlbi9w
b2xnZW4uYyAgICAgICAgICAgICAgICAgICB8ICAxNDUgKysrCiBzZWN1cml0eS9LY29uZmlnICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDExICstCiBzZWN1cml0eS9NYWtlZmlsZSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxICsKIHNlY3VyaXR5L2lwZS8uZ2l0aWdu
b3JlICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDEgKwogc2VjdXJpdHkvaXBlL0tjb25maWcg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEwMCArKwogc2VjdXJpdHkvaXBlL01ha2VmaWxl
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzOSArCiBzZWN1cml0eS9pcGUvYXVkaXQuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMzA0ICsrKysrCiBzZWN1cml0eS9pcGUvYXVkaXQu
aCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQxICsKIHNlY3VyaXR5L2lwZS9jdHguYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzODEgKysrKysrCiBzZWN1cml0eS9pcGUvY3R4
LmggICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQzICsKIHNlY3VyaXR5L2lwZS9jdHhf
dGVzdC5jICAgICAgICAgICAgICAgICAgICAgICB8ICA3MzIgKysrKysrKysrKysrCiBzZWN1cml0
eS9pcGUvZXZhbC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMjM3ICsrKysKIHNlY3Vy
aXR5L2lwZS9ldmFsLmggICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNTcgKwogc2VjdXJp
dHkvaXBlL2ZzLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMyNyArKysrKysKIHNl
Y3VyaXR5L2lwZS9mcy5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMTMgKwogc2Vj
dXJpdHkvaXBlL2hvb2tzLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMyOCArKysrKysK
IHNlY3VyaXR5L2lwZS9ob29rcy5oICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNTYgKwog
c2VjdXJpdHkvaXBlL2lwZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE0MyArKysK
IHNlY3VyaXR5L2lwZS9pcGUuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMjcgKwog
c2VjdXJpdHkvaXBlL2lwZV9wYXJzZXIuaCAgICAgICAgICAgICAgICAgICAgIHwgICA1OSArCiBz
ZWN1cml0eS9pcGUvbW9kdWxlcy5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTM0ICsrKwog
c2VjdXJpdHkvaXBlL21vZHVsZXMuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxNyArCiBz
ZWN1cml0eS9pcGUvbW9kdWxlcy9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgIDY2ICsrCiBz
ZWN1cml0eS9pcGUvbW9kdWxlcy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgIDEyICsKIHNl
Y3VyaXR5L2lwZS9tb2R1bGVzL2Jvb3RfdmVyaWZpZWQuYyAgICAgICAgICB8ICAgMjQgKwogc2Vj
dXJpdHkvaXBlL21vZHVsZXMvZG12ZXJpdHlfcm9vdGhhc2guYyAgICAgIHwgICA4MCArKwogc2Vj
dXJpdHkvaXBlL21vZHVsZXMvZG12ZXJpdHlfc2lnbmF0dXJlLmMgICAgIHwgICAyNSArCiBzZWN1
cml0eS9pcGUvbW9kdWxlcy9mc3Zlcml0eV9kaWdlc3QuYyAgICAgICAgfCAgIDgwICsrCiBzZWN1
cml0eS9pcGUvbW9kdWxlcy9mc3Zlcml0eV9zaWduYXR1cmUuYyAgICAgfCAgIDMzICsKIHNlY3Vy
aXR5L2lwZS9tb2R1bGVzL2lwZV9tb2R1bGUuaCAgICAgICAgICAgICB8ICAgNDAgKwogc2VjdXJp
dHkvaXBlL3BhcnNlcnMuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEzOSArKysKIHNlY3Vy
aXR5L2lwZS9wYXJzZXJzL01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAgMTIgKwogc2VjdXJp
dHkvaXBlL3BhcnNlcnMvZGVmYXVsdC5jICAgICAgICAgICAgICAgIHwgIDEwNiArKwogc2VjdXJp
dHkvaXBlL3BhcnNlcnMvcG9saWN5X2hlYWRlci5jICAgICAgICAgIHwgIDEyNiArKwogc2VjdXJp
dHkvaXBlL3BvbGljeS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTAzNyArKysrKysrKysr
KysrKysrKwogc2VjdXJpdHkvaXBlL3BvbGljeS5oICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDExMyArKwogc2VjdXJpdHkvaXBlL3BvbGljeV9wYXJzZXJfdGVzdHMuYyAgICAgICAgICAgIHwg
IDI5OSArKysrKwogc2VjdXJpdHkvaXBlL3BvbGljeWZzLmMgICAgICAgICAgICAgICAgICAgICAg
IHwgIDUyOCArKysrKysrKysKIHNlY3VyaXR5L3NlY3VyaXR5LmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgNzYgKy0KIDYzIGZpbGVzIGNoYW5nZWQsIDcwNjkgaW5zZXJ0aW9ucygrKSwg
MTggZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9hZG1pbi1n
dWlkZS9MU00vaXBlLnJzdAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vc2VjdXJp
dHkvaXBlLnJzdAogY3JlYXRlIG1vZGUgMTAwNjQ0IHNjcmlwdHMvaXBlL01ha2VmaWxlCiBjcmVh
dGUgbW9kZSAxMDA2NDQgc2NyaXB0cy9pcGUvcG9sZ2VuLy5naXRpZ25vcmUKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBzY3JpcHRzL2lwZS9wb2xnZW4vTWFrZWZpbGUKIGNyZWF0ZSBtb2RlIDEwMDY0NCBz
Y3JpcHRzL2lwZS9wb2xnZW4vcG9sZ2VuLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzZWN1cml0eS9p
cGUvLmdpdGlnbm9yZQogY3JlYXRlIG1vZGUgMTAwNjQ0IHNlY3VyaXR5L2lwZS9LY29uZmlnCiBj
cmVhdGUgbW9kZSAxMDA2NDQgc2VjdXJpdHkvaXBlL01ha2VmaWxlCiBjcmVhdGUgbW9kZSAxMDA2
NDQgc2VjdXJpdHkvaXBlL2F1ZGl0LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzZWN1cml0eS9pcGUv
YXVkaXQuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHNlY3VyaXR5L2lwZS9jdHguYwogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHNlY3VyaXR5L2lwZS9jdHguaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHNlY3VyaXR5
L2lwZS9jdHhfdGVzdC5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgc2VjdXJpdHkvaXBlL2V2YWwuYwog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHNlY3VyaXR5L2lwZS9ldmFsLmgKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBzZWN1cml0eS9pcGUvZnMuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHNlY3VyaXR5L2lwZS9mcy5o
CiBjcmVhdGUgbW9kZSAxMDA2NDQgc2VjdXJpdHkvaXBlL2hvb2tzLmMKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBzZWN1cml0eS9pcGUvaG9va3MuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHNlY3VyaXR5L2lw
ZS9pcGUuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHNlY3VyaXR5L2lwZS9pcGUuaAogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHNlY3VyaXR5L2lwZS9pcGVfcGFyc2VyLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBz
ZWN1cml0eS9pcGUvbW9kdWxlcy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgc2VjdXJpdHkvaXBlL21v
ZHVsZXMuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHNlY3VyaXR5L2lwZS9tb2R1bGVzL0tjb25maWcK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBzZWN1cml0eS9pcGUvbW9kdWxlcy9NYWtlZmlsZQogY3JlYXRl
IG1vZGUgMTAwNjQ0IHNlY3VyaXR5L2lwZS9tb2R1bGVzL2Jvb3RfdmVyaWZpZWQuYwogY3JlYXRl
IG1vZGUgMTAwNjQ0IHNlY3VyaXR5L2lwZS9tb2R1bGVzL2RtdmVyaXR5X3Jvb3RoYXNoLmMKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBzZWN1cml0eS9pcGUvbW9kdWxlcy9kbXZlcml0eV9zaWduYXR1cmUu
YwogY3JlYXRlIG1vZGUgMTAwNjQ0IHNlY3VyaXR5L2lwZS9tb2R1bGVzL2ZzdmVyaXR5X2RpZ2Vz
dC5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgc2VjdXJpdHkvaXBlL21vZHVsZXMvZnN2ZXJpdHlfc2ln
bmF0dXJlLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzZWN1cml0eS9pcGUvbW9kdWxlcy9pcGVfbW9k
dWxlLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzZWN1cml0eS9pcGUvcGFyc2Vycy5jCiBjcmVhdGUg
bW9kZSAxMDA2NDQgc2VjdXJpdHkvaXBlL3BhcnNlcnMvTWFrZWZpbGUKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBzZWN1cml0eS9pcGUvcGFyc2Vycy9kZWZhdWx0LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBz
ZWN1cml0eS9pcGUvcGFyc2Vycy9wb2xpY3lfaGVhZGVyLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBz
ZWN1cml0eS9pcGUvcG9saWN5LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzZWN1cml0eS9pcGUvcG9s
aWN5LmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzZWN1cml0eS9pcGUvcG9saWN5X3BhcnNlcl90ZXN0
cy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgc2VjdXJpdHkvaXBlL3BvbGljeWZzLmMKCi0tIAoyLjMz
LjAKCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczov
L2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

