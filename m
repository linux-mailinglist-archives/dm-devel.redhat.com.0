Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 064BA6C2324
	for <lists+dm-devel@lfdr.de>; Mon, 20 Mar 2023 21:50:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679345446;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ABhpA7JpZbQxeA8rJOBU4sd3LlJJGvG/IgXigPk1YIU=;
	b=De+Rlxr85HXCStq+3dQebrPdaOn8mY2xccbQo/OwjShMH0dyz7sQu8V44Hc6/lsCqoXo0S
	ayD2AulqjPSJ9uHLItLPRy+SZ9qSSus3sZLyOM9W9KU2QI61U1pcOTXjMM3wlS9rLvQlv+
	KDf1e2ccAxCMmTLZBXGStSEjyZe4frs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-WniwliXdNCGaH15eNqobKw-1; Mon, 20 Mar 2023 16:50:45 -0400
X-MC-Unique: WniwliXdNCGaH15eNqobKw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E787F1C05EC4;
	Mon, 20 Mar 2023 20:50:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B5250140EBF4;
	Mon, 20 Mar 2023 20:50:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9773419465B8;
	Mon, 20 Mar 2023 20:50:32 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8D1A61946594
 for <dm-devel@listman.corp.redhat.com>; Mon, 20 Mar 2023 20:50:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6C213400D927; Mon, 20 Mar 2023 20:50:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6403B40224EF
 for <dm-devel@redhat.com>; Mon, 20 Mar 2023 20:50:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43BE33C11788
 for <dm-devel@redhat.com>; Mon, 20 Mar 2023 20:50:31 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-1_oWUI-TOB-zKArk-rDRQg-1; Mon, 20 Mar 2023 16:50:29 -0400
X-MC-Unique: 1_oWUI-TOB-zKArk-rDRQg-1
Received: by mail-pl1-f174.google.com with SMTP id bc12so13267267plb.0
 for <dm-devel@redhat.com>; Mon, 20 Mar 2023 13:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679345428;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WxllmilUxM/Gi+0kdMqEpmEpGk2qdzk2AoRMfFIyk1Q=;
 b=t0ZxKO6PEatnI+gox5MojNiiKeKkb/KTHlXDSRF6YNTZKNs14tdM6b7g/6eNk3U7EV
 2P1y4y+AOH+pk23KoBGTG7ABJTZrF4GU4DwYbdoIwzjPsmk0imN4x3JYLY/S0rYlgAi3
 6aucAExE/1SioJqmWuBSdi/l2sW+OL8aksKkE62n+cj0rnwZuj5BRhYoZaXMo/5Pmvej
 cgLNXS7eiNaF2RuqWsw+koIVb+FHaWT9el2F7HYU82uAZ3SGXzPn1PnS6DN9wKrMLSdL
 Pba3igMX3kTYmb7Fm6ObCYW6pbFlSdeDGUSnKnUai6wKZx31u5sB/xf8M4SiF1qZNcZP
 GEDw==
X-Gm-Message-State: AO0yUKW5RYiphZxhKh/D/q4hxy4cvXbvz0NM7ANukfQ5qmgtL5HDm4D6
 oVXhjQH0miSW5ptx3Dbrv2dbXYk6LT8ePKF89O8=
X-Google-Smtp-Source: AK7set8McwK8b9PsPT32mE3kdW5rRKBDp58wfd4XvwaU5Wz4pe9YMKYgPShlSkilnyhc5c3W96H/Zg==
X-Received: by 2002:a17:902:e74d:b0:19e:6bc5:8769 with SMTP id
 p13-20020a170902e74d00b0019e6bc58769mr22216411plf.69.1679345428233; 
 Mon, 20 Mar 2023 13:50:28 -0700 (PDT)
Received: from smtpclient.apple ([165.225.243.3])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a17090274c900b001a1b245f8b4sm5550291plt.236.2023.03.20.13.50.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Mar 2023 13:50:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
From: Brian Bunker <brian@purestorage.com>
In-Reply-To: <20230320194146.GH19878@octiron.msp.redhat.com>
Date: Mon, 20 Mar 2023 13:50:16 -0700
Message-Id: <8AA6ECD8-859C-4BCB-ABA6-D95911C64560@purestorage.com>
References: <CD5EC3B3-9A64-416A-A04C-C68EDB82F4C6@purestorage.com>
 <a85c4b5a6603be979ddb9aa0909808519a03fa3e.camel@suse.com>
 <20230320194146.GH19878@octiron.msp.redhat.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [dm-devel] [PATCH] multipath-tools Consider making 'smart' the
 default
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
Cc: device-mapper development <dm-devel@redhat.com>,
 Martin Wilck <mwilck@suse.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Cj4gT24gTWFyIDIwLCAyMDIzLCBhdCAxMjo0MSBQTSwgQmVuamFtaW4gTWFyemluc2tpIDxibWFy
emluc0ByZWRoYXQuY29tPiB3cm90ZToKPiAKPiBPbiBNb24sIE1hciAyMCwgMjAyMyBhdCAwMzox
ODozN1BNICswMTAwLCBNYXJ0aW4gV2lsY2sgd3JvdGU6Cj4+IE9uIFRodSwgMjAyMy0wMy0xNiBh
dCAxNDo0NyAtMDcwMCwgQnJpYW4gQnVua2VyIHdyb3RlOgo+Pj4gQXMgYSB0YXJnZXQgdmVuZG9y
LCBpdCBpcyBuaWNlIHRvIGJlIGFibGUgY29udHJvbCBpbml0aWF0b3IKPj4+IGJlaGF2aW9yIGZy
b20gdGhlIHRhcmdldCB3aXRob3V0IHJlbHlpbmcgb24gdXNlciBpbnRlcnZlbnRpb24KPj4+IG9u
IHRoZSBpbml0aWF0b3IuIFRoZXJlIGNvdWxkIGJlIGEgdmVyeSBsYXJnZSBudW1iZXIgb2YgaW5p
dGlhdG9ycwo+Pj4gYXQgYSBzaXRlLgo+Pj4gCj4+PiBXaGVuIEFDTHMgYXJlIGZpcnN0IGFkZGVk
IGZvciBhIHZvbHVtZSBvbiBvdXIgYXJyYXksIHdlIHVzZSB0aGUKPj4+IHRyYW5zcG9ydCBsYXll
ciwgc28gdGhhdCB0aGUgaW5pdGlhdG9yIHdpbGwgZGlzY292ZXIgdGhlIHZvbHVtZXMKPj4+IHdp
dGhvdXQgYW55IG1hbnVhbCBpbnRlcnZlbnRpb24uCj4+PiAKPj4+IGtlcm5lbDogc2NzaSA4OjA6
MDoxOiBEaXJlY3QtQWNjZXNzIFBVUkUgRmxhc2ggQXJyYXkKPj4+IDg4ODggUFE6IDAgQU5TSTog
Ngo+Pj4ga2VybmVsOiBzY3NpIDk6MDowOjE6IERpcmVjdC1BY2Nlc3MgUFVSRSBGbGFzaCBBcnJh
eQo+Pj4gODg4OCBQUTogMCBBTlNJOiA2Cj4+PiBrZXJuZWw6IHNjc2kgNjowOjA6MTogRGlyZWN0
LUFjY2VzcyBQVVJFIEZsYXNoIEFycmF5Cj4+PiA4ODg4IFBROiAwIEFOU0k6IDYKPj4+IGtlcm5l
bDogc2NzaSA3OjA6MDoxOiBEaXJlY3QtQWNjZXNzIFBVUkUgRmxhc2ggQXJyYXkKPj4+IDg4ODgg
UFE6IDAgQU5TSTogNgo+Pj4gLi4uCj4+PiBrZXJuZWw6IHNkIDY6MDowOjE6IFtzZGRdIEF0dGFj
aGVkIFNDU0kgZGlzawo+Pj4ga2VybmVsOiBzZCA4OjA6MDoxOiBbc2RiXSBBdHRhY2hlZCBTQ1NJ
IGRpc2sKPj4+IGtlcm5lbDogc2QgOTowOjA6MTogW3NkY10gQXR0YWNoZWQgU0NTSSBkaXNrCj4+
PiBrZXJuZWw6IHNkIDc6MDowOjE6IFtzZGVdIEF0dGFjaGVkIFNDU0kgZGlzawo+Pj4gCj4+PiBT
dWJzZXF1ZW50IHZvbHVtZXMgYWZ0ZXIgdGhlIGZpcnN0IG9uZSBhcmUgZGlzY292ZXJlZCB2aWEg
dW5pdAo+Pj4gYXR0ZW50aW9ucyB0cmlnZ2VyaW5nIHRoZSB1ZGV2IHJ1bGUgd2hpY2ggY2FsbHMg
c2Nhbi1zY3NpLXRhcmdldC4KPj4+IFRoZSBTQ1NJIGRldmljZXMgYmVpbmcgZGlzY292ZXJlZCB3
aXRob3V0IGNyZWF0aW5nIHRoZSBjb3JyZXNwb25kaW5nCj4+PiBtdWx0aXBhdGggZGV2aWNlcyBz
ZWVtcyB0byBiZSBhIGJhZCBkZWZhdWx0LiBXZSB3b3VsZCBsaWtlIHRvCj4+PiBjb250cm9sIGFz
IG11Y2ggYXMgcG9zc2libGUgZnJvbSB0aGUgdGFyZ2V0IHNpZGUgdG8gZGljdGF0ZSBpbml0aWF0
b3IKPj4+IGJlaGF2aW9yLiBUaGlzIGNvbWVzIGFzIGEgcmVncmVzc2lvbiB0byBob3cgaXQgcHJl
dmlvdXNseSB3b3JrZWQuCj4+PiAKPj4+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIEJ1bmtlciA8YnJp
YW5AcHVyZXN0b3JhZ2UuY29tPgo+PiAKPj4gSSdtIGZpbmUgd2l0aCB0aGlzLCBidXQga2VlcCBp
biBtaW5kIHRoYXQgZGlzdHJpYnV0aW9ucyB3aWxsIHByb2JhYmx5Cj4+IG92ZXJyaWRlIHRoaXMg
YW55d2F5LiBSZWQgSGF0IGFuZCBTVVNFIGhhdmUgaGFkIGRpZmZlcmVudCBkZWZhdWx0cyBmb3IK
Pj4gdGhpcyBiYXNpY2FsbHkgZm9yZXZlci4gQXQgbGVhc3QgZW50ZXJwcmlzZSBkaXN0cm9zIHdv
bid0IHJpc2sKPj4gcmVncmVzc2lvbnMgYmVjYXVzZSBvZiBjaGFuZ2luZyBkZWZhdWx0cy4KPj4g
Cj4+IEJlbiwgd2hhdCdzIHlvdXIgb3BpbmlvbiB3cnQgdGhlIHBhdGNoPwo+IAo+IHRsO2RyOiBJ
IHRoaW5rICJ5ZXMiIG1ha2VzIG1vcmUgc2Vuc2UgdGhhbiAic21hcnQiLgo+IAo+IEkgZG9uJ3Qg
a25vdyBpZiB0aGlzIGlzIGEgZ29vZCBpZGVhLiBUaGUgZGVmYXVsdCBiZWhhdmlvciB3ZSBzZXQg
aXMKPiBnb2luZyB0byBiZSB3aGF0IGhhcHBlbnMgd2hlbiBwZW9wbGUgZG9uJ3Qgc2V0IHVwIGEg
Y29uZmlndXJhdGlvbiBmaWxlLgo+IEkgZ2V0IHRoYXQgInN0cmljdCIgbWVhbnMgeW91IGhhdmUg
dG8gbWFudWFsbHkgc2V0IHVwIG1hcHMuIEJ1dCB0aGF0Cj4gYWN0dWFsbHkgc2VlbXMgbGlrZSBh
IHJlYXNvbmFibGUgZGVmYXVsdCBpZiB5b3UgZG9uJ3QgaGF2ZSBhCj4gY29uZmlndXJhdGlvbiBz
ZXQgdXAuIFVzaW5nICJubyIgb3IgImdyZWVkeSIgbWVhbnMgdGhhdCB5b3UgaGF2ZSB0byBzZXQK
PiB1cCBhIGNvbmZpZ3VyYXRpb24sIG9yIG11bHRpcGF0aCB3aWxsIGp1c3QgdXNlIGFsbCB5b3Vy
IGRldmljZXMsIGFuZAo+IHRoYXQgc2VlbXMgbXVjaCB3b3JzZS4gQnV0IGlmIHdlIHdhbnQgdG8g
bWFrZSBtdWx0aXBhdGggImp1c3QgZG8gdGhlCj4gcmlnaHQgdGhpbmcgd2l0aG91dCBnZXR0aW5n
IGluIG15IHdheSIsIHRoZW4gSSB3b3VsZCBhcmd1ZSAieWVzIiBpcyBhCj4gYmV0dGVyIGFsdGVy
bmF0aXZlLgpJIGFtIGdvb2Qgd2l0aCDigJh5ZXPigJkgdG9vLiBJIHRoaW5rIGl0IGlzIGltcG9y
dGFudCB0byBjb25zaWRlciBpbnN0YWxsYXRpb25zCndoZXJlIGEgY29uZmlndXJhdGlvbiBmaWxl
IGlzIGFkZGVkIGFmdGVyIGFuIGluaXRpYWwgaW5zdGFsbGF0aW9uLiBJdCBpcyBsaWtlbHksCmF0
IGxlYXN0IGZvciB1cywgdGhhdCB0aGUgZGVmYXVsdCB2YWx1ZSBvZiBmaW5kX211bHRpcGF0aHMg
aXMgbm90IG92ZXIKd3JpdHRlbiBidXQgaW5oZXJpdGVkIGZyb20gZGVmYXVsdC4gV2hhdCB0aGlz
IG1lYW5zIGlzIHRoYXQgZGlzdHJpYnV0aW9ucwp3aGljaCB0YWtlIHRoaXMg4oCZc3RyaWN04oCZ
IGRlZmF1bHQgd2lsbCBub3QgZ2V0IG11bHRpcGF0aCBkZXZpY2VzIGNyZWF0ZWQKCi1Ccmlhbgo+
IAo+IFRoZSBiZW5lZml0IG9mIHVzaW5nICJ5ZXMiIGlzIHRoYXQgbXVsdGlwYXRoIHdpbGwgYWxt
b3N0IGFsd2F5cwo+IGNvcnJlY3RseSBmaW5kIHlvdXIgbXVsdGlwYXRoIGRldmljZXMsIGFuZCB3
aWxsIG5ldmVyIGZhaWwgaW4gYSB3YXkKPiB3aGVyZSBpdCBncmFicyBkZXZpY2VzIGl0IHNob3Vs
ZG4ndC4gIFRoZSBvbmx5IHRpbWUgaXQgd2lsbCBmYWlsIGlzIG9uIGEKPiBtdWx0aXBhdGhhYmxl
IGRldmljZSB0aGF0IGhhcyBuZXZlciBiZWVuIG11bHRpcGF0aGVkIGJlZm9yZSwgYW5kIGl0IHdp
bGwKPiBvbmx5IG5vdCB3b3JrIGlmIHNvbWV0aGluZyBlbHNlIHN0YXJ0cyB1c2luZyB0aGUgZmly
c3QgcGF0aCBvZiB0aGUKPiBkZXZpY2UgYmVmb3JlIHRoZSBzZWNvbmQgcGF0aCBhcHBlYXJzIGFu
ZCBtdWx0aXBhdGhkIGNyZWF0ZXMgYSBtdWx0aXBhdGgKPiBkZXZpY2Ugb24gaXQuICBUaGlzIHJl
YWxseSBvbmx5IGhhcHBlbnMgd2hlbiB0aGlzIG5ldyBkZXZpY2UgaGFzIHNvbWUKPiBtZXRhZGF0
YSBvbiBpdCB0aGF0IGNhdXNlcyBzb21ldGhpbmcgdG8gYXV0b21hdGljYWxseSBncmFiIGl0IChm
b3IKPiBpbnN0YW5jZSBhIExBQkVMIGZvciBhIGZpbGVzeXN0ZW0gdGhhdCBnZXRzIGF1dG9tb3Vu
dGVkLCBvciBMVk0gbWV0YWRhdGEKPiBmb3IgYSBkZXZpY2UgdGhhdCBnZXRzIGF1dG9hY3RpdmF0
ZWQpLiAgSSBkb24ndCBhY3R1YWxseSBrbm93IG9mIGFueQo+IHJlYWwgZG93bnNpZGVzIHRvIHVz
aW5nICJ5ZXMiLCBhbmQgaWYgdGhlcmUgd2VyZSBzb21lLCB0aGV5IHdvdWxkIGFsc28KPiBiZSBk
b3duc2lkZXMgdG8gdXNpbmcgInNtYXJ0Igo+IAo+IFRoZXJlIGFyZSByZWFsIGRvd25zaWRlcyB0
byB1c2luZyAic21hcnQiIHdpdGhvdXQgc2V0dGluZyB1cCBhCj4gY29uZmlndXJhdGlvbiBmaWxl
LiBFdmVyeSBzaW5nbGUgdGltZSB5b3UgYm9vdCwgdGhlIHJlc3Qgb2YgdGhlIHN5c3RlbSdzCj4g
YWNjZXNzIHRvIHlvdXIgcG9zc2libHkgbXVsdGlwYXRoYWJsZSBkZXZpY2VzIGlzIGRlbGF5ZWQg
d2hpbGUgbXVsdGlwYXRoCj4gd2FpdHMgc2Vjb25kcyBmb3IgYSBzaWJsaW5nIHRvIGFwcGVhci4g
SW4gcmV0dXJuIGZvciB0aGlzIGlzc3VlIHRoYXQKPiBoYXBwZW5zIG9uIGV2ZXJ5IGJvb3QgZm9y
IGV2ZXJ5IHBvc3NpYmx5IG11bHRpcGF0aGFibGUgZGV2aWNlLCB0aGUgb25seQo+IGJlbmZpdCB5
b3UgZ2V0IG92ZXIgInllcyIsIGlzIHRoYXQgd2hlbiB5b3UgYWRkIGEgbmV3IGRldmljZSB0byB5
b3VyCj4gc3lzdGVtLCBpZiB0aGVyZSBpcyBkYXRhIG9uIHRoZSBkZXZpY2UgdGhhdCB3b3VsZCBj
YXVzZSBpdCB0byBiZQo+IGF1dG9hc3NlbWJsZWQgYW5kIHRoZSBzZWNvbmQgcGF0aCBhcHBlYXJz
IHdpdGhpbiBzZWNvbmRzIG9mIHRoZSBmaXJzdAo+IHBhdGggKGVpdGhlciAxIG9yIDEwLCBkZXBl
bmRpbmcgb24gd2hldGhlciBvciBub3QgdGhlcmUgaXMgYSBidWlsdC1pbgo+IGNvbmZpZyBmb3Ig
dGhlIHN0b3JhZ2UgYXJyYXkpLCBtdWx0aXBhdGggd2lsbCBjb3JyZWN0bHkgZ3JhYiB0aGUgZGV2
aWNlLAo+IGluc3RlYWQgb2Ygd2hhdGV2ZXIgd2FzIGdvaW5nIHRvIGF1dG9hc3NlbWJsZSBvbiBp
dC4gIFRoaXMgaXMgYSB2ZXJ5Cj4gcmFyZSBvY2N1cmFuY2UsIHN0aWxsIGxlYXZlcyB5b3Ugd2l0
aCBhIHJ1bm5pbmcgc3lzdGVtLCBhbmQgY2FuIGVhc2lseQo+IGJlIGZpeGVkIGFmdGVyIHRoZSBm
YWN0Lgo+IAo+IFRoZXJlJ3Mgb25seSBvbmUgdGltZSB3aGVuIFJIRUwgbWFrZXMgdXNlIG9mICJz
bWFydCIsIGFuZCB0aGF0J3MgZHVyaW5nCj4gaW5zdGFsbGF0aW9uLiAgRm9yIHJlYXNvbnMgd2hp
Y2ggSSBkb24ndCB1bmRlcnN0YW5kLCB0aGUgUkhFTCBpbnN0YWxsZXIKPiB3aWxsIGF1dG9hc3Nl
bWJsZSBMVk0vTUQgZGV2aWNlcyBpZiB0aGVyZSBpcyBleGlzdGluZyBtZXRhZGF0YSBvbiBkaXNr
cwo+IHdoZW4gaXQgYm9vdHMuIEluIHRoaXMgY2FzZSB0aGUgc3lzdGVtIGlzIHVuYXZvaWRhYmx5
IHNlZWluZyBhbGwgb2YgdGhlCj4gc3RvcmFnZSBkZXZpY2VzIGZvciB0aGUgdmVyeSBmaXJzdCB0
aW1lLCB3aXRob3V0IG11bHRpcGF0aCBiZWluZwo+IGNvbmZpZ3VyZWQgZm9yIHRoZXNlIGRldmlj
ZXMsIGFuZCBpdCBub3QgdW5saWtlbHkgdGhhdCB3ZSB3aWxsIHNlZQo+IGRldmljZXMgd2l0aCBM
Vk0vTUQgbWV0YWRhdGEgb24gdGhlbS4gVGhpcyBtZWFucyB0aGF0IExWTS9NRCB3aWxsIGxpa2Vs
eQo+IGF1dG9hc3NlbWJsZSBiZWZvcmUgdGhlIHNlY29uZCBwYXRoIGFwcGVhcnMsIGFuZCB0aGUg
ZGV2aWNlIGdldHMKPiBtdWx0aXBhdGhlZC4gVGhpcyBjb25mdXNlcyB0aGUgaW5zdGFsbGVyLiBT
aW5jZSB3ZSBvbmx5IGRvIHRoaXMgaW4gdGhlCj4gaW5zdGFsbGVyLCB3ZSBvbmx5IHNlZSB0aGUg
InNtYXJ0IiBkZWxheSBvbiByZWxlYXNpbmcgdGhlIGRldmljZXMgdG8gdGhlCj4gc3lzdG1lIG9u
ZSB0aW1lLiBJbiB0aGlzIHNpdHVhdGlvbiwgdXNpbmcgInNtYXJ0IiBtYWtlcyBzZW5zZSAoYWx0
aG91Z2gKPiBub3QgYXMgbXVjaCBzZW5zZSBhcyBzaW1wbHkgbm90IGF1dG9hc3NlbWJsaW5nIExW
TSBkZXZpY2VzIHdoZW4gdGhlCj4gaW5zdGFsbGVyIGJvb3RzLCBJTUhPKS4KPiAKPiBUaGUgb25s
eSBvdGhlciBzaXR1YXRpb24gd2hlcmUgInNtYXJ0IiB3b3VsZCBiZSBnZW5lcmFsbHkgaGVscGZ1
bCBpcyBpZgo+IHlvdSBoYXZlIHlvdXIgc3lzdGVtIGNvbmZpZ3VyZWQgc28gdGhhdCBhbGwgZGV2
aWNlcyBhcmUgYmxhY2tsaXN0ZWQKPiBleGNlcHQgdGhlIHR5cGVzIHRoYXQgYXJlIHN1cHBvc2Vk
IHRvIGJlIG11bHRpcGF0aGVkLiBJbiB0aGlzIHNpdHVhdGlvbgo+IHlvdSB3b3VsZG4ndCBoYXZl
IHRvIHdvcnJ5IGFib3V0IHRoZSBkZWxheSBvbiBldmVyeSBib290IGJlY2F1c2UgYWxsIHRoZQo+
IG5vbi1tdWx0aXBhdGhhYmxlIGRldmljZXMgd291bGQgYmUgYmxhY2tsaXN0ZWQuIElmIGEgbmV3
IG11bHRpcGF0aGFibGUKPiBkZXZpY2UgYXBwZWFyZWQsIHRoZW4gInNtYXJ0IiB3b3VsZCBndWFy
YW50ZWUgdGhhdCBub3RoaW5nIGVsc2Ugd291bGQKPiBncmFiIGl0IGJlZm9yZSB0aGUgc2Vjb25k
IHBhdGggYXBwZWFyZWQgKGFzc3VtaW5nIHRoYXQgdGhlIHNlY29uZCBwYXRoCj4gYXBwZWFyZWQg
d2l0aGluIHRoZSB0aW1lb3V0KS4gSG93ZXZlciwgeW91IHF1aXRlIGxpa2VseSBzdGlsbCBzaG91
bGRuJ3QKPiB1c2UgInNtYXJ0IiBpbiB0aGlzIGNhc2UuICBJZiB5b3UgYWxyZWFkeSBoYXZlIHlv
dXIgY29uZmlndXJhdGlvbiBzZXQgdXAKPiBsaWtlIHRoaXMsIHRoZW4geW91IGNhbiBqdXN0IHVz
ZSAiZ3JlZWR5IiBhbmQgZ2V0IHRoZSBzYW1lIGJlbmVmaXQsCj4gd2l0aG91dCBoYXZpbmcgdG8g
d29ycnkgYWJvdXQgdGhlIHNlY29uZCBwYXRoIHNob3dpbmcgdXAgb24gdGltZS5cCj4gCj4gSXQg
aXMgcG9zc2libGUgdGhhdCB5b3UgY2FuJ3Qgc2V0IHVwIHlvdSBjb25maWd1cmF0aW9uIHRvIGNv
cnJlY3RseSBzb3J0Cj4gYWxsIHRoZSBkZXZpY2VzIHRoYXQgbWF5IGFwcGVhciBpbiB0aGUgZnV0
dXJlIGludG8gbXVsdGlwYXRoYWJsZSBhbmQKPiBub24tbXVsdGlwYXRoYWJsZS4gSW4gdGhpcyBj
YXNlLCBpZiBpdCdzIGltcG9ydGFudCB0aGF0IHRoZXNlIG5ldwo+IGRldmljZXMgYXJlIGNvcnJl
Y3RseSBtdWx0aXBhdGhlZCB0aGUgZmlyc3QgdGltZSB0aGV5IHNob3cgdXAsIHRoZW4KPiAic21h
cnQiIGFsc28gbWFrZXMgc2Vuc2UuIEJ1dCBJIGRvbid0IHRoaW5rIHRoYXQgdGhpcyBjYXNlIHdh
cyBzbwo+IGNvbW1vbiB0aGF0IHdlIHNob3VsZCBhc3N1bWUgdGhhdCBpdCdzIHRoZSBkZWZhdWx0
IGZvciBwZW9wbGUgd2hvCj4gaW5zdGFsbCB0aGUgbXVsdGlwYXRoIHRvb2xzLiBJdCB0YWtlcyB2
ZXJ5IGxpdHRsZSBlZmZvcnQgdG8gY2hhbmdlIHRoZQo+IGZpbmRfbXVsdGlwYXRocyBzZXR0aW5n
LiBUaGUgcGVvcGxlIHdobyBhcmVuJ3QgaW50ZXJlc3RlZCBlbm91Z2ggaW4KPiB0aGVpciBtdWx0
aXBhdGggc2V0dXAgdG8gZG8gdGhhdCBwcm9iYWJseSBhcmVuJ3QgdGhlIHBlb3BsZSB0aGF0IHdh
bnQKPiBtdWx0aXBhdGggY2xhaW1pbmcgdGhlaXIgZGV2aWNlcyBmb3IgYSBjb3VwbGUgc2Vjb25k
cyBldmVyeSBib290LCBqdXN0Cj4gaW4gY2FzZSB3ZSdyZSBpbiB0aGF0IHJhcmUgc2l0dWF0aW9u
IHdoZXJlIGl0IGNvdWxkIG1ha2UgYSBkaWZmZXJlbmNlLgo+IAo+IC1CZW4KPiAKPj4gUmVnYXJk
cwo+PiBNYXJ0aW4KCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNv
bQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVsCg==

