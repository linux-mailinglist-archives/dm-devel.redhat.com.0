Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7CB25B9FC
	for <lists+dm-devel@lfdr.de>; Thu,  3 Sep 2020 07:06:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-sUCUuGPlMHusCABxLwsnSg-1; Thu, 03 Sep 2020 01:06:00 -0400
X-MC-Unique: sUCUuGPlMHusCABxLwsnSg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4487A10ABDB1;
	Thu,  3 Sep 2020 05:05:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07C8C2C370;
	Thu,  3 Sep 2020 05:05:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8595879DBB;
	Thu,  3 Sep 2020 05:05:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08355Qmu031040 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 01:05:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B721D1111A44; Thu,  3 Sep 2020 05:05:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B25941111A42
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 05:05:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 982A780158E
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 05:05:23 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-91-UqC38pRINPmRDUwGknj7Xw-1;
	Thu, 03 Sep 2020 01:05:20 -0400
X-MC-Unique: UqC38pRINPmRDUwGknj7Xw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1CD7BAC2B;
	Thu,  3 Sep 2020 05:05:20 +0000 (UTC)
To: Mike Snitzer <snitzer@redhat.com>
References: <20200902160432.GA5513@redhat.com>
	<df0203fa-7f75-53ac-8bf1-79a1c861918e@suse.de>
	<20200902164456.GA5928@redhat.com>
	<4968af50-663d-74cf-1be2-aaed48a380d5@suse.de>
	<20200902165101.GB5928@redhat.com>
From: Coly Li <colyli@suse.de>
Autocrypt: addr=colyli@suse.de; keydata=
	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
Message-ID: <d175dda1-d196-8283-d099-9e4db70f96aa@suse.de>
Date: Thu, 3 Sep 2020 13:05:13 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200902165101.GB5928@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, linux-nvdimm@lists.01.org,
	Vishal Verma <vishal.l.verma@intel.com>, dm-devel@redhat.com,
	Jan Kara <jack@suse.com>, Ira Weiny <ira.weiny@intel.com>
Subject: Re: [dm-devel] flood of "dm-X: error: dax access failed" due to 5.9
 commit 231609785cbfb
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------0F92E39F92669280CF59FFE0"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0F92E39F92669280CF59FFE0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 2020/9/3 00:51, Mike Snitzer wrote:
> On Wed, Sep 02 2020 at 12:46pm -0400,
> Coly Li <colyli@suse.de> wrote:
> 
>> On 2020/9/3 00:44, Mike Snitzer wrote:
>>> On Wed, Sep 02 2020 at 12:40pm -0400,
>>> Coly Li <colyli@suse.de> wrote:
>>>
>>>> On 2020/9/3 00:04, Mike Snitzer wrote:
>>>>> 5.9 commit 231609785cbfb ("dax: print error message by pr_info() in
>>>>> __generic_fsdax_supported()") switched from pr_debug() to pr_info().
>>>>>
>>>>> The justification in the commit header is really inadequate.  If there
>>>>> is a problem that you need to drill in on, repeat the testing after
>>>>> enabling the dynamic debugging.
>>>>>
>>>>> Otherwise, now all DM devices that aren't layered on DAX capable devices
>>>>> spew really confusing noise to users when they simply activate their
>>>>> non-DAX DM devices:
>>>>>
>>>>> [66567.129798] dm-6: error: dax access failed (-5)
>>>>> [66567.134400] dm-6: error: dax access failed (-5)
>>>>> [66567.139152] dm-6: error: dax access failed (-5)
>>>>> [66567.314546] dm-2: error: dax access failed (-95)
>>>>> [66567.319380] dm-2: error: dax access failed (-95)
>>>>> [66567.324254] dm-2: error: dax access failed (-95)
>>>>> [66567.479025] dm-2: error: dax access failed (-95)
>>>>> [66567.483713] dm-2: error: dax access failed (-95)
>>>>> [66567.488722] dm-2: error: dax access failed (-95)
>>>>> [66567.494061] dm-2: error: dax access failed (-95)
>>>>> [66567.498823] dm-2: error: dax access failed (-95)
>>>>> [66567.503693] dm-2: error: dax access failed (-95)
>>>>>
>>>>> commit 231609785cbfb must be reverted.
>>>>>
>>>>> Please advise, thanks.
>>>>
>>>> Adrian Huang from Lenovo posted a patch, which titled: dax: do not print
>>>> error message for non-persistent memory block device
>>>>
>>>> It fixes the issue, but no response for now. Maybe we should take this fix.
>>>
>>> OK, yes sounds like it.  It was merged and is commit c2affe920b0e066
>>> ("dax: do not print error message for non-persistent memory block
>>> device")
>>
>> Thanks for informing me this patch is merged, I am going to update my
>> local one :-)
> 
> So the thing is I'm running v5.9-rc3 (which includes this commit) but
> I'm still seeing all these warnings when I run the lvm2 testsuite.  The
> reason _seems_ to be because the lvm2 testsuite uses brd devices for
> test devices.  So there is something about the brd device that shows
> commit c2affe920b0e066 isn't enough :(

Could you please apply and test this attached patch based on v5.9-rc3 ?

It seems the pointer dax_dev of __generic_fsdax_supported() parameter is
not initialized (IMHO this is not a dm bug), therefore the && should be
|| to check the dax support state.

Also I add two pr_info() to print the variables value, let's see whether
my guess makes sense.

Thanks.

Coly Li


--------------0F92E39F92669280CF59FFE0
Content-Type: text/plain; charset=UTF-8; x-mac-type="0"; x-mac-creator="0";
	name="0001-dax-fix-for-do-not-print-error-message-for-non-persi.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename*0="0001-dax-fix-for-do-not-print-error-message-for-non-persi.pa";
	filename*1="tch"

RnJvbSAzNzE0YjkxMzYyNjY5YzRkM2UyODFhY2ZlMTk3ZTkyMmExZGQxYjRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBDb2x5IExpIDxjb2x5bGlAc3VzZS5kZT4KRGF0ZTogVGh1LCAz
IFNlcCAyMDIwIDEyOjI1OjEzICswODAwClN1YmplY3Q6IFtQQVRDSF0gZGF4OiBmaXggZm9yIGRv
IG5vdCBwcmludCBlcnJvciBtZXNzYWdlIGZvciBub24tcGVyc2lzdGVudAogbWVtb3J5IGJsb2Nr
IGRldmljZQoKV2hlbiBjYWxsaW5nIF9fZ2VuZXJpY19mc2RheF9zdXBwb3J0ZWQoKSwgYSBkYXgt
dW5zdXBwb3J0ZWQgZGV2aWNlIG1heQpub3QgaGF2ZSBkYXhfZGV2IGFzIE5VTEwuIFRoZXJlZm9y
ZSBldmVuIGRheF9kZXYgaXMgbm90IE5VTEwsIGl0IGlzCnN0aWxsIG5lY2Vzc2FyeSB0byBjYWxs
IGJkZXZfZGF4X3N1cHBvcnRlZCgpIHRvIGNoZWNrIHdoZXRoZXIgdGhlIGRldmljZQpzdXBwb3J0
cyBkYXguCgpTaWduZWQtb2ZmLWJ5OiBDb2x5IExpIDxjb2x5bGlAc3VzZS5kZT4KLS0tCiBkcml2
ZXJzL2RheC9zdXBlci5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kYXgvc3VwZXIuYyBiL2RyaXZl
cnMvZGF4L3N1cGVyLmMKaW5kZXggMzI2NDI2MzRjMWJiLi5hNWJkZmNhMDUyOWEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZGF4L3N1cGVyLmMKKysrIGIvZHJpdmVycy9kYXgvc3VwZXIuYwpAQCAtMTAw
LDcgKzEwMCw5IEBAIGJvb2wgX19nZW5lcmljX2ZzZGF4X3N1cHBvcnRlZChzdHJ1Y3QgZGF4X2Rl
dmljZSAqZGF4X2RldiwKIAkJcmV0dXJuIGZhbHNlOwogCX0KIAotCWlmICghZGF4X2RldiAmJiAh
YmRldl9kYXhfc3VwcG9ydGVkKGJkZXYsIGJsb2Nrc2l6ZSkpIHsKKwlwcl9pbmZvKCJkYXhfZGV2
OiAlcFxuIiwgZGF4X2Rldik7CisJcHJfaW5mbygiYmRldl9kYXhfc3VwcG9ydGVkKCk6ICVkXG4i
LCBiZGV2X2RheF9zdXBwb3J0ZWQoYmRldiwgYmxvY2tzaXplKSk7CisJaWYgKCFkYXhfZGV2IHx8
ICFiZGV2X2RheF9zdXBwb3J0ZWQoYmRldiwgYmxvY2tzaXplKSkgewogCQlwcl9kZWJ1ZygiJXM6
IGVycm9yOiBkYXggdW5zdXBwb3J0ZWQgYnkgYmxvY2sgZGV2aWNlXG4iLAogCQkJCWJkZXZuYW1l
KGJkZXYsIGJ1ZikpOwogCQlyZXR1cm4gZmFsc2U7Ci0tIAoyLjI2LjIKCg==
--------------0F92E39F92669280CF59FFE0
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--------------0F92E39F92669280CF59FFE0--

